import 'package:foodie/models/cart.dart';
import 'package:get/get.dart';

class  CartRespository extends GetxController{

final _cartList=<Cart>[].obs;
final _totalAmount=0.obs;
int get totalAmount => _totalAmount.value;
List<Cart> get cartList => _cartList.value;

Future AddToCart(Cart cart)async{
 var value=cartList;

 _cartList.add(cart);

calculateAmount();
Get.back();


}

void removeCart(Cart cart){

 var value=cartList;

 
 _cartList.remove(cart);

 print("cart list ${cartList.length}");
  calculateAmount();


}
void calculateAmount(){
int amount=0;
cartList.forEach((element) {
  
amount+=element.foodMenu!.normalPrice!;
});
_totalAmount(amount);


} 




  
}