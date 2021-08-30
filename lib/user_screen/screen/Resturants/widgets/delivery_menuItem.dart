import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/repository/food_menu_repository.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/user_screen/screen/food_details_screen.dart';
import 'package:foodie/user_screen/widget/dishes.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

import '../../../../dummy_data.dart';

class DeliveryManuItem extends StatefulWidget {
  DeliveryManuItem({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  _DeliveryManuItemState createState() => _DeliveryManuItemState();
}

class _DeliveryManuItemState extends State<DeliveryManuItem> {
  final controller=Get.find<FoodMenuRepository>();
  @override
  Widget build(BuildContext context) {
    // final food = dummyDishes.toList();
    return Obx(()
{
   if(controller.status==FoodMenuStatus.FoodMenuFound){
     var list=controller.foodmenuList;

        return ListView(
          controller: widget.controller,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  height: 40,
                  //  width: getProportionateScreenWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.grey[500]!.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IgnorePointer(
                      child: TextField(
                        // textCapitalization: textCapitalization,
                        cursorColor: UIData.kbrightColor,
                        onTap: () {},
                        autofocus: false,
                        //controller: _searchcontroller,
    
                        // initialValue: initialValue,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        //readOnly: ,
                        keyboardType: TextInputType.name,
                        minLines: 1,
    
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.search,
                              color: UIData.kbrightColor,
                            ),
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            customTitleText("Trending", colors: UIData.kbrightColor, size: 16),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
                height: getProportionateScreenHeight(160),
                child: ListView.builder(
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) => Container(
                          width: getProportionateScreenWidth(120),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: DeliveryMenuItemWidget(
                         foodMenu: list[index],
                            ),
                          ),
                        ))),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            customTitleText("Popular Dishes",
                colors: UIData.kbrightColor, size: 16),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Divider(),
            Container(
              child: ListView.separated(
                controller: widget.controller,
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(),
                itemCount: list.length,
                itemBuilder: (context, index) => DishesWidget(
                 foodMenu: list[index],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            )
          ],
        );
      }else if(controller.status==FoodMenuStatus.Isloading){
return Container(
  width: 50,
  height: 20,
  child: Center(child: CircularProgressIndicator(color:  UIData.kbrightColor,)));

      }else{
return Container(
  child:Text("Error occurred")
);

      }
 }
    );
  }
}

class DeliveryMenuItemWidget extends StatelessWidget {
  const DeliveryMenuItemWidget({Key? key, this.foodMenu})
      : super(key: key);

  final FoodMenu? foodMenu;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Get.to(FoodDetails(foodMenu: foodMenu,));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(
                         "",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customDescriptionText(foodMenu!.menuName!, fontSize: 12),
                    customTitleText('${foodMenu!.normalPrice}', size: 14)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
