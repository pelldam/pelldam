import 'dart:convert';
import 'package:foodie/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static String isLogin = "App is Login";
  static String firstTimeAppOpen = " First Time  app open";
  SharedPreferences? _preferences;
  SharePref() {
    print("sharepref init");
    init();
  }
  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setUser(UserModel user) {
    _preferences!.setString(isLogin, jsonEncode(user.toUserJson()));
  }

  void logout() {
    _preferences!.setString(isLogin, "");
  }

  read() async {
 
    final key = 'token';
    final value = _preferences!.get(key);
    print('read: $value');
    return value;
  }
  saveToken(String value){
_preferences!.setString("token", value);


  }

  UserModel? getUser() {
    var user = _preferences!.getString(isLogin);
    print("user value $user");
    if (user != null && user.isNotEmpty) {
      var json = jsonDecode(user);
      UserModel uservalue = UserModel.fromJson(json);
      return uservalue;
    } else {
      return null;
    }
  }

  void setFirstTimeOpen(bool value) {
    _preferences!.setBool(firstTimeAppOpen, value);
  }

  bool getFirstTimeOpen() {
    var value = _preferences!.getBool(firstTimeAppOpen);
    print(" first time ");
    return value == null ? false : true;
  }
}
