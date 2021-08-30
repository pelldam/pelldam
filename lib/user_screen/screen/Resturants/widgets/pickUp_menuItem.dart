import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/repository/food_menu_repository.dart';
import 'package:foodie/user_screen/widget/dishes.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

import '../../../../dummy_data.dart';

class PickupMenuItem extends StatefulWidget {
  const PickupMenuItem({Key? key, this.controller}) : super(key: key);

  final ScrollController? controller;

  @override
  _PickupMenuItemState createState() => _PickupMenuItemState();
}

class _PickupMenuItemState extends State<PickupMenuItem> {
    final controller=Get.find<FoodMenuRepository>();
        final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Obx(()
{
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
                        controller: _searchcontroller,
    
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
      }
    );
  }
}
