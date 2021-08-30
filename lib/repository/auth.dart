import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/authentication_screen/screens/login.dart';
import 'package:foodie/authentication_screen/screens/verify_phone.dart';
import 'package:foodie/models/restaurant_model.dart';
import 'package:foodie/models/user.dart';
import 'package:foodie/shared_preference/shared_pref.dart';
import 'package:foodie/user_screen/screen/delivery_screen.dart';
import 'package:foodie/user_screen/screen/nav_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  Loading,
  Authenticated,
  UnAuthenticated,
  Error,
  Unknown_Error,
  Empty,
  IS_FIRST_TIME,
  PHONE_EXISTED,
  EMAIL_EXISTED,
  USERNAME_EXISTED
}

class AuthServices extends GetxController {
  String serverUrl = 'https://foodgital2.herokuapp.com/';
  final _errorMessage = "".obs;

  late TextEditingController loginusernameController, loginpasswordController;
  late TextEditingController fullnameController,
      signupusernameController,
      signupemailController,
      signupPasswordController,
      signupPhonenumberController,
      signupfirstnameController,
      signuplastnameController;
  late FocusNode loginuserNameFocusNode, loginpasswordFocusNode;


  var isLoading = false.obs;
  final token="".obs;

  final _status = Status.Empty.obs;
  String get errorMessage => _errorMessage.value;
  UserModel? user;
  Rx<UserModel> liveUser=Rx(UserModel());
  Status get status => _status.value;
  SharePref? pref;
  // final baseUrl = 'https://foodgital2.herokuapp.com/api/';

  Restaurant? longitude, latitude;

  Future<List>? category;

  get restaurant => null;

  @override
  void onInit() async {
    category = getCategoryData();
    pref = SharePref();
    print(" onInit called");
    await pref!.init();
    if (pref!.getFirstTimeOpen()) {
      print(" is first time");
      _status(Status.IS_FIRST_TIME);
    } else {
      print("is not first");
      if (pref!.getUser() != null) {
        user = pref!.getUser()!;
        liveUser(user);
        token(pref!.read());
        print("user is not null");
        _status(Status.Authenticated);
      } else {
        _status(Status.UnAuthenticated);
      }
    }

    loginusernameController = TextEditingController();
    loginpasswordController = TextEditingController();

    signupusernameController = TextEditingController();
    signupemailController = TextEditingController();
    signupPasswordController = TextEditingController();
    signupfirstnameController = TextEditingController();
    signuplastnameController = TextEditingController();
    signupPhonenumberController = TextEditingController();
    fullnameController = TextEditingController();

    loginuserNameFocusNode = FocusNode();
    loginpasswordFocusNode = FocusNode();

    super.onInit();
  }

  concertenate() {
    return fullnameController.text =
        signupfirstnameController.text + signuplastnameController.text;
  }

Future<bool> isPropetyExist({String? propertyKey,String? propertyValue})async{
var response= await http.post(Uri.parse("http://foodgital2.herokuapp.com/users/check-property-duplicate"),
body: {
"propertyKey":propertyKey,
"propertyValue":propertyValue

});

if(response.statusCode==201){

  return false;
}else {
return true;

}

}
void updateIsFirstTime(bool value){

pref!.setFirstTimeOpen(value);
}

Future checkPhoneAndEmailAndUsername({String? email,String? phone, String? username})async{
 _status(Status.Loading);
 bool isphoneExist= await isPropetyExist(propertyKey: "phoneNumber",propertyValue: phone);
  if(isphoneExist){

    _status(Status.PHONE_EXISTED);
  }else{
bool isEmailExist= await isPropetyExist(propertyKey: "email",propertyValue: email);
if(isEmailExist){
 
_status(Status.EMAIL_EXISTED);
}else{
bool isUserNameExist= await isPropetyExist(propertyKey: "username",propertyValue: username);

if(isUserNameExist){

_status(Status.USERNAME_EXISTED);
}else {
 user=UserModel(username: username,phoneNumber: phone,email: email,password: signupPasswordController.text);
 _status(Status.Empty);
Get.to(VerifyPhoneScreen(),transition:  Transition.rightToLeft);

}


}
    
  }



}
  Future<dynamic> register(
  
  ) async {
    try {
      _status(Status.Loading);
     user!.fullName=fullnameController.text;

       print("user detail json ${user!.toJson()}");
      var response = await http.post(
          Uri.parse('http://foodgital2.herokuapp.com/users/create-user'),
          body: user!.toJson());
      
      var json = jsonDecode(response.body);
      print("reponse $json");
      // var response = await http.post(
      // Uri.parse('https://foodgital2.herokuapp.com/users/create-user'),
      // body: user.toJson());
      if (response.statusCode == 201) {
        var userModel = UserModel.fromJson(json['response']);
        user = userModel;
        liveUser(user);
        _status(Status.Authenticated);
        pref!.setUser(user!);
        Get.offNamed(DeliveryScreen.routeName,);
        // Get.off(VerifyPhoneScreen());
        // reg successful;

      } else if (response.statusCode == 409) {
        // error occurred
        _errorMessage(json["message"]);

        _status(Status.Error);
      } else if (response.statusCode == 400) {
        var message = List.from(json["message"]);
        print("message $message");
        _errorMessage(message[0]);
        _status(Status.Error);
      } else {
        _status(Status.Unknown_Error);
      }

      return response.body;
    } catch (e) {
      _status(Status.Unknown_Error);
      _errorMessage("No Internet Connection");
      print("Error occurred ${e.toString()}");
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginpasswordController.dispose();
    loginusernameController.dispose();
    loginpasswordFocusNode.dispose();
    loginuserNameFocusNode.dispose();
  }

  Future<dynamic> login(String username, String password) async {
    try {
      _status(Status.Loading);
      var response = await http.post(
        Uri.parse('http://foodgital2.herokuapp.com/users/sign-in'),
        body: {"username": username, "password": password},
      );
      // //isLoading.isTrue;
      var json = jsonDecode(response.body);
    
      if (response.statusCode == 201) {
        print("result is $json");
        var userModel = UserModel.fromJson(json['response']['response']);
        // print("result is ${json['response']['response']}");
        // String token = json['response']['token'];
        user = userModel;
        token(json['response']["token"]);
     print("token is ${token.value}");
        if (userModel != null) {
          _status(Status.Authenticated);

          isLoading(false);
          print("User Value ${userModel.toUserJson()}");
          liveUser(userModel);
          pref!.setUser(userModel);
          _save(token.value);
          Get.off(() => UserNavScreen());
          // login successful;
        }
      } else if (response.statusCode == 401) {
        // error occurred
        _errorMessage(json["message"]);
        _status(Status.Error);
      } else if (response.statusCode == 400) {
        // error occurred
          var message = List.from(json["message"]);
        _errorMessage(message[0]);
        _status(Status.Error);
      }else if(response.statusCode==401){

          var message=json['message'];
          _status(Status.Error);
          _errorMessage(message);

      }
      
       else {
        _errorMessage("Unknown Error");

        _status(Status.Unknown_Error);
      }
      return response.body;
    } catch (ex) {
      _status(Status.Unknown_Error);
      _errorMessage(ex.toString());
      print(ex.toString());
      // you can do somethig here
    }
  }

  Future<List> getCategoryData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var response = await http.get(
        Uri.parse(
            'https://foodgital2.herokuapp.com/food-category/view-all-categories'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $value'
        });
    // if (!response){errorMessage: food no dey}
    List<Map<String, dynamic>> res =
        List<Map<String, dynamic>>.from(json.decode(response.body)['response']);
    // print('$res is good');
    // setState(() {
    //   data = res;
    // });
    return res;
  }

  Future<List> getRestaurantNearBy() async {
    final prefs = await SharedPreferences.getInstance();
    // String? longitude = longitude.longitude, latitude = controller.latitude;
    // print('longitude: $longitude', 'latitude: $latitude');
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var response = await http.get(
        Uri.parse(
            'http://foodgital2.herokuapp.com/restaurant/view-nearby-restaurants'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $value'
        });
    // if (!response){errorMessage: food no dey}
    List<Map<String, dynamic>> res =
        List<Map<String, dynamic>>.from(json.decode(response.body)['response']);
    print('$res is good');
    // setState(() {
    //   data = res;
    // });
    return res;
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  void updateStatus(Status status) {
    _status(status);
  }

  void logout() {
    _status(Status.UnAuthenticated);
    pref!.logout();
    Get.off((LoginScreen()));
  }
}
