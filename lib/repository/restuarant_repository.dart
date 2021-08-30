import 'dart:convert';

import 'package:foodie/models/restaurant_model.dart';
import 'package:foodie/models/resturant.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/repository/food_menu_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
enum ResturantStatus {ResturantAvailable, Empty,Loading,ErrorOccurred}
enum NearbyRestaurantStatus {RestuarantAvailable, Error, Loading, NotRestaurantAvailable,Empty }
class RestaurantRepository extends GetxController{

final userController=Get.find<AuthServices>();
Rx<List<Restaurant>>? _resturantList=Rx([]);
Rx<List<Restaurant>>? _nearbyRestuarant=Rx([]);

List<Restaurant> get resturantList=>_resturantList!.value;
List<Restaurant> get nearByresturantList=>_nearbyRestuarant!.value;
final _status=ResturantStatus.Empty.obs;
final _nearbyRestaurantStatus= NearbyRestaurantStatus.Empty.obs;
NearbyRestaurantStatus get nearbyRestaurantStatus=> _nearbyRestaurantStatus.value;
Rx<Restaurant> pcurrentRestaurant=Rx(Restaurant());
ResturantStatus get  status=>_status.value;
Restaurant get currentRestaurant=>pcurrentRestaurant.value;
@override
  void onInit() {
    // TODO: implement onInit
        getNearbyRestaurant();
    super.onInit();

  }
  void setCurrentRestaurant(Restaurant restaurant){
    print("restaurant is set");

pcurrentRestaurant(restaurant);

  }
void getResturantList()async{
try{
var response= await http.get(Uri.parse("http://foodgital2.herokuapp.com/restaurant/view-all-restaurants"),headers: {
     "Accept": "application/json",
          'Authorization': 'Bearer ${userController.token.value}'

});
if (response.statusCode==201){

var result=jsonDecode(response.body);
print("restaurant result $result");
var json=List.from(result['response']);
List<Restaurant> _list=json.map((e) =>Restaurant.fromJson(e)).toList();
_resturantList!(_list);

_status(ResturantStatus.ResturantAvailable);
}else{


  _status(ResturantStatus.ErrorOccurred);
}




}catch(ex){
 _status(ResturantStatus.ErrorOccurred);

}

}
Future getNearbyRestaurant()async{
try{
  // print("nearby restaurant is found");
  _nearbyRestaurantStatus(NearbyRestaurantStatus.Loading);
var response=await http.post(Uri.parse("http://foodgital2.herokuapp.com/restaurant/view-nearby-restaurants"),body:jsonEncode({

"latitude":0,
"longitude":0

}),
headers: {

  // "Accept": "application/json",
  "Content-Type":"application/json"
});
print("response ${response.body}");
if(response.statusCode==201){

  var result=jsonDecode(response.body);
  var json=List.from(result['response']);
  print("response value ${json.length}");
  var list=json.map((e) => Restaurant.nearbyResurantFromJson(e['restaurant'],e)).toList();
  print("result list ${list.length}");
  _nearbyRestuarant!(list);
  if(list.isNotEmpty){

    _nearbyRestaurantStatus(NearbyRestaurantStatus.RestuarantAvailable);
  }else {
_nearbyRestaurantStatus(NearbyRestaurantStatus.NotRestaurantAvailable);


  }
}
}catch(ex){

print("an error has occurred ${ex.toString()}");

ex.printInfo();

_nearbyRestaurantStatus(NearbyRestaurantStatus.Error);
}




}
}