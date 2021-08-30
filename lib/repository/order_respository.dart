

import 'dart:convert';

import 'package:foodie/models/order.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/user_screen/screen/upComing_order.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
enum OrderStatus{ Loading,Success,Error,Empty}
class OrderRespository extends GetxController{

final userController=Get.find<AuthServices>();
final restuarantController=Get.find<RestaurantRepository>();
final cartController=Get.find<CartRespository>();
final _status=OrderStatus.Empty.obs;

OrderStatus get status=> _status.value;
Rx<Order> _currentOrder=Rx(Order());
Rx<List<Order>> _previousOrderList=Rx([]);
List<Order> get previousOrderList=>_previousOrderList.value;
Order get currentOrder=>_currentOrder.value;


 @override
  void onInit() async{

  userController.liveUser.listen((p0) {
     print("new usee gotten");
    getPreviousOrderList();
  });
  
  }
 Future createOrder()async{
try{
  print("create order is trying to create");
  _status(OrderStatus.Loading);

var response =await http.post(Uri.parse("http://foodgital2.herokuapp.com/order/create-order"),
body: jsonEncode(
  
  {

"userId":userController.user!.userId,
"restaurantId":restuarantController.currentRestaurant.restaurantId,
"menuIds":cartController.cartList.map((e) => e.foodMenu!.restaurantMenuId).toList(),
"userAddressId":"",
"restaurantAddressId":"",
"promoCode":"",
"orderNote":""
  }
),
headers: {
  "Accept": "application/json",
   "Content-Type":"application/json",
          'Authorization': 'Bearer ${userController.token.value}'


}
);
if(response.statusCode==201){

var result=jsonDecode(response.body);
print("result order ${result['response']}");
var json=result['response'];
_currentOrder(Order.createFromJson(json));
_status(OrderStatus.Success);
     Get.toNamed(UpComingOrderScreen.routeName);
}else{
var result=jsonDecode(response.body);
print("result order $result");
_status(OrderStatus.Error);

}




 }
 catch(ex){
ex.printError();
_status(OrderStatus.Error);

 }
}

Future getPreviousOrderList()async{

var response= await http.get(Uri.parse("http://foodgital2.herokuapp.com/order/view-user-orders/${userController.user!.userId}"),headers: {

  "Accept": "application/json",
          'Authorization': 'Bearer ${userController.token.value}'
});
if(response.statusCode==200){
var result=jsonDecode(response.body);
print("previous list $result");
var list=List.from(result['response']).map((e) => Order.fromJson(e)).toList();
_previousOrderList(list);
}




}



}