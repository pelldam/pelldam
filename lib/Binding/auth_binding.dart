import 'package:foodie/controllers/progressindicator.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/repository/food_menu_repository.dart';
import 'package:foodie/repository/order_respository.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthServices(), permanent: true);
    Get.put(RestaurantRepository(),permanent: true);
    Get.put(FoodMenuRepository(),permanent: true);
    Get.put(CartRespository(),permanent:true );
    Get.put(OrderRespository(),permanent: true);
    Get.lazyPut<ProgressIndicatorController>(
        () => ProgressIndicatorController());
  }
}
