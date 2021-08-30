import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

class ResturantFloatingContainer extends StatelessWidget {
  ResturantFloatingContainer({
    Key? key,
  }) : super(key: key);
final  controller=Get.find<RestaurantRepository>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(150),
      width: getProportionateScreenWidth(300),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 5),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customTitleText("${controller.currentRestaurant.restaurantName}",
                size: 18, colors: UIData.kbrightColor),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customDescriptionText("Fries"),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  customDescriptionText("Grills"),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  customDescriptionText("Fast Food"),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  customDescriptionText("NN"),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  customDescriptionText("4.5",
                      fontWeight: FontWeight.bold, colors: Colors.black),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: UIData.kbrightColor,
                  size: 20,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                customDescriptionText(controller.currentRestaurant.addresss!),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 23,
              width: 80,
              decoration: BoxDecoration(
                  color: UIData.kbrightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: customDescriptionText("25-30 min", colors: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
