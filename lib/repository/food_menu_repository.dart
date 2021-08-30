import 'dart:convert';

import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/shared_preference/shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 enum FoodMenuStatus{Isloading, FoodMenuFound,Error,Empty, FoodMenuNotFound}
class FoodMenuRepository extends GetxController{
final restuarantController=Get.find<RestaurantRepository>();
SharePref? pref;
Rx<List<FoodMenu>> _foodmenulist=Rx([]);

List<FoodMenu> get  foodmenuList => _foodmenulist.value;

final _status=FoodMenuStatus.Empty.obs;
FoodMenuStatus get status=> _status.value;
  @override
  void onInit() async{
       pref = SharePref();
    print(" onInit called");
    await pref!.init();
    super.onInit();
restuarantController.pcurrentRestaurant.listen((p0) {
  print("changes made");
  getFoodMenu(p0.restaurantId!);


});
  }
Future getFoodMenu(String id)async{
 try{
   print("start loading value");
   _status(FoodMenuStatus.Isloading);
  var token=await pref!.read();
  print("token is $token");
     var response = await http.get(
          Uri.parse(
              'http://foodgital2.herokuapp.com/restaurant-menu/view-restaurant-menu/$id'),
          headers: {
            "Accept": "application/json",
            "Authorization":"bearer $token"
          });

 if(response.statusCode==200){
   var result=jsonDecode(response.body);
   print("result $result");
   var json=List.from(result['response']);
     var foodMenuList=json.map((e) => FoodMenu.fromJson(e)).toList();
_foodmenulist(foodMenuList);

 if(foodMenuList.isNotEmpty)
 _status(FoodMenuStatus.FoodMenuFound);
 else
 _status(FoodMenuStatus.FoodMenuNotFound);
 }else {
print("error response ${response.body}");
_status(FoodMenuStatus.Error);

 }
 }catch(ex){
   ex.printError();
   print("error occurred");
_status(FoodMenuStatus.Error);
 
 }
}



}