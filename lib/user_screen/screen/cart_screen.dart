import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/repository/order_respository.dart';
import 'package:foodie/user_screen/screen/upComing_order.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartRespository> {
 CartScreen({Key? key}) : super(key: key);

 final orderController=Get.find<OrderRespository>();
  static const routeName = "./cart_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(children: [
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.9,
              minChildSize: 0.7,
              builder: (BuildContext context, ScrollController controllers) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 24, right: 24),
                        child: ListView(
                            controller: controllers,
                            scrollDirection: Axis.vertical,
                            children: [
                              customTitleText("DELIVER TO",
                                  colors: UIData.kbrightColor, size: 13),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customTitleText(
                                          "No. 18 Alibaba Crescent, Jabi",
                                          size: 14),
                                      customDescriptionText("Office",
                                          fontSize: 13)
                                    ],
                                  ),
                                  Container(
                                      width: 35,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0XFFF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(30),
                              ),
                              customTitleText("The Dough Factory", size: 18),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              Obx(()
                        
                              {
                                      print("update value cartController.cartList.length");
                                  return Container(
                                    // height: getProportionateScreenHeight(200),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.cartList.length,
                                        controller: controllers,
                                        itemBuilder: (BuildContext context,
                                                index){
                                                 
                                                  return
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0, top: 8, bottom: 8),
                                              child: (Container(
                                                height:
                                                    getProportionateScreenHeight(
                                                        55),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/pickup.png"),
                                                                fit: BoxFit.cover)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SingleChildScrollView(
                                                        child: Container(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: 16,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    customDescriptionText(
                                                                        "${controller.cartList[index].quantity}x",
                                                                        fontSize:
                                                                            11),
                                                                    SizedBox(
                                                                      width:
                                                                          getProportionateScreenWidth(
                                                                              10),
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        customTitleText(
                                                                           controller.cartList[index].foodMenu!.menuName!,
                                                                            size:
                                                                                12),
                                                                        SizedBox(
                                                                          height:
                                                                              getProportionateScreenHeight(
                                                                                  5),
                                                                        ),
                                                                        customTitleText(
                                                                            "${controller.cartList[index].foodMenu!.normalPrice}",
                                                                            size:
                                                                                12),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                GestureDetector(
                                                                  onTap: (){
                                                                 controller.removeCart(controller.cartList[index]);

                                                                  },
                                                                  child: Container(
                                                                      width: 35,
                                                                      height: 45,
                                                                      decoration: BoxDecoration(
                                                                          color: UIData
                                                                              .kbrightColor
                                                                              .withOpacity(
                                                                                  0.1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  8)),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Icon(
                                                                        Icons
                                                                            .delete_outline,
                                                                        size: 15,
                                                                        color: UIData
                                                                            .kbrightColor,
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            );
                                                }),
                                  );
                                }
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: UIData.kbrightColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(10),
                                  ),
                                  customTitleText("Add more items",
                                      colors: Color(0xFF1A6164), size: 14)
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              CartWidget(
                                color: Colors.amber,
                                icon: Icons.two_wheeler,
                                title: "Delivery",
                                subtittle: "N500",
                              ),
                              CartWidget(
                                color: Colors.black54,
                                icon: Icons.confirmation_num,
                                title: "Promo code",
                                subtittle: "HXFWO",
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customTitleText("Payment Type",
                                      colors: Color(0xFFA3A3A4), size: 14),
                                  customTitleText("change",
                                      size: 12, colors: UIData.kbrightColor)
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(40),
                              ),
                              customTitleText("Wallet",
                                  colors: Colors.black, size: 14),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customTitleText("Order Type",
                                      colors: Color(0xFFA3A3A4), size: 14),
                                  Container(
                                    height: getProportionateScreenHeight(25),
                                    width: getProportionateScreenWidth(130),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              color: Color(0xFF1A6164)),
                                          child: Center(
                                            child: customDescriptionText(
                                                "Delivery",
                                                fontSize: 12,
                                                colors: Colors.white),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xFF1A6164)),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: customDescriptionText(
                                                      "Pick-up",
                                                      fontSize: 12,
                                                      colors:
                                                          Color(0xFF1A6164)),
                                                ))),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ])));
              }),
          Obx(()
           {
              return Positioned(
                bottom: 40,
                left: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
             if(orderController.status==OrderStatus.Loading){
               return;
             }
             orderController.createOrder();
              
                  },
                  child: Container(
                      height: getProportionateScreenHeight(55),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: UIData.kbrightColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: getProportionateScreenWidth(500),
                      child:(orderController.status==OrderStatus.Loading)?Container(
                        width: 30,
                        height: 30,
                        child:Center(child: CircularProgressIndicator(color: Colors.white,)),
                      ): Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitleText("Checkout",
                                colors: Colors.white, size: 14),
                            Obx(()
                             {
                                return customTitleText("N${controller.totalAmount}", colors: Colors.white, size: 14);
                              }
                            )
                          ],
                        ),
                      )),
                ),
              );
            }
          ),
        ])));
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget(
      {Key? key, this.color, this.icon, this.title, this.subtittle})
      : super(key: key);

  final Color? color;
  final IconData? icon;
  final String? title;
  final String? subtittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
      child: (Container(
        height: getProportionateScreenHeight(55),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color!.withOpacity(0.1)),
                child: Center(
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // customDescriptionText("1x", fontSize: 11),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customTitleText(title!, size: 12),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                customTitleText(subtittle!, size: 12),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            width: 35,
                            height: 45,
                            decoration: BoxDecoration(
                                color: UIData.kbrightColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8)),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: UIData.kbrightColor,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
