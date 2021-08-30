import 'package:flutter/material.dart';
import 'package:foodie/Utils/constants.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/user_screen/screen/order_screen.dart';
import 'package:foodie/widget/customWidgets.dart';

class OrdersWidget extends StatelessWidget {
  final Order? order;
  OrdersWidget({Key? key,this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(OrdersScreen.routeName);
      },
      child: Container(
        height: getProportionateScreenHeight(180),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset("assets/images/dough.png"),
                          )),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTitleText(order!.restaurant!.restaurantName!, size: 15),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customDescriptionText("${order!.createdAt!.formatDate()}"),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 3,
                                        width: 3,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      customDescriptionText("${order!.createdAt!.formatDate(pattern:"hh:mm")}"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: getProportionateScreenHeight(20),
                                width: getProportionateScreenWidth(30),
                                decoration: BoxDecoration(
                                    color: Color(0xFF419D3E).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: customDescriptionText(order!.status!,
                                        fontSize: 10,
                                        colors: Color(0xFFFACD5D))),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(38),
                          width: getProportionateScreenWidth(154),
                          decoration: BoxDecoration(
                            color: UIData.kbrightColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: customDescriptionText("Details",
                                colors: Colors.white),
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(38),
                          width: getProportionateScreenWidth(154),
                          decoration: BoxDecoration(
                              color: UIData.kbrightColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: customDescriptionText("Get help",
                                colors: UIData.kbrightColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
