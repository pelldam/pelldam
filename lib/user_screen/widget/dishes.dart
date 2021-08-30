import 'package:flutter/material.dart';
import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/user_screen/screen/food_details_screen.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

class DishesWidget extends StatelessWidget {
  const DishesWidget(
      {Key? key, this.foodMenu})
      : super(key: key);
final FoodMenu? foodMenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Get.to(FoodDetails(foodMenu: foodMenu));
      },
      child: Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDescriptionText(foodMenu!.menuName!,
                          fontSize: 14, colors: Colors.black87),
                      customDescriptionText(foodMenu!.description!),
                      customTitleText('${foodMenu!.normalPrice!}', size: 13)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/pickup.png"))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
