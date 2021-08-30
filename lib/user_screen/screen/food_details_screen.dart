import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/cart.dart';
import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

class FoodDetails extends StatefulWidget {
  FoodMenu? foodMenu;
   FoodDetails({Key? key,this.foodMenu}) : super(key: key);

  static const routeName = "/FoodDetails";

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  buildlistTile(
    String foodName,
    String price,
    bool val1,
    VoidCallback condition,
  ) {
    return ListTile(
        leading: Checkbox(
          value: isChecked,
          onChanged: (val1) => condition,
          activeColor: UIData.kbrightColor,
        ),
        title: customTitleText(foodName, size: 13),
        trailing: customTitleText(price, size: 13));
  }

  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool? value;

  final _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Image.asset(
            "assets/images/food_details.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 40, left: 40, child: backArrow(Navigator.of(context).pop)),
          Positioned(
            top: 30,
            right: 40,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: UIData.kbrightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                )),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 24, right: 24),
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          children: [
                            customTitleText(widget.foodMenu!.menuName!, size: 22),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            customDescriptionText(
                                widget.foodMenu!.description!),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            customTitleText("Let's make it better?",
                                colors: UIData.kbrightColor, size: 13),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            ListTile(
                                leading: Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  activeColor: UIData.kbrightColor,
                                ),
                                title:
                                    customTitleText("Extra Tomatoes", size: 13),
                                trailing: customTitleText("N200", size: 13)),
                            ListTile(
                                leading: Checkbox(
                                  value: isChecked1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked1 = value!;
                                    });
                                  },
                                  activeColor: UIData.kbrightColor,
                                ),
                                title: customTitleText("Extra Olive", size: 13),
                                trailing: customTitleText("N250", size: 13)),
                            ListTile(
                                leading: Checkbox(
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                  activeColor: UIData.kbrightColor,
                                ),
                                title: customTitleText("Extra Sauce", size: 13),
                                trailing: customTitleText("N350", size: 13)),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _searchcontroller,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.add,
                                  color: Colors.black12,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0XFFF2F2F2)),
                                ),
                                // hoverColor: UIData.kFormColor,
                                fillColor: Colors.black12,
                                filled: true,

                                hintText: 'Any special request',
                                hintStyle: TextStyle(
                                    fontSize: 13, color: Colors.black12),

                                contentPadding: EdgeInsets.only(
                                    left: 16, right: 8, top: 8, bottom: 8),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0XFFF2F2F2)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0XFFF2F2F2)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(50),
                                  width: getProportionateScreenWidth(100),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black12),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(50),
                                  width: getProportionateScreenWidth(150),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: UIData.kbrightColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                   final controller=Get.find<CartRespository>();
                                   Cart cart=Cart(foodMenu: widget.foodMenu,quantity: 1,note: "");
                                   controller.AddToCart(cart);




                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          customTitleText("Add",
                                              colors: Colors.white, size: 14),
                                          customTitleText('N${widget.foodMenu!.normalPrice!}',
                                              colors: Colors.white, size: 14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )));
              })
        ])));
  }
}
