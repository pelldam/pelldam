import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/user_screen/widget/orders_widget.dart';
import 'package:foodie/widget/customWidgets.dart';

const double PIN_VISIBLE_POSITION = 40;

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  static const routeName = "/oreders_screen";

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  double pinPillPosition = PIN_VISIBLE_POSITION;
  buildContainer(String name, String price, String multiple) {
    return Container(
      height: getProportionateScreenHeight(40),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 30,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: customDescriptionText(multiple),
                    )),
              ),
            )),
        Expanded(
            flex: 6,
            child: Container(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: customTitleText(name, size: 14),
            ))),
        Expanded(
          flex: 2,
          child: Container(
              child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: customDescriptionText(multiple + "x"),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: customTitleText(price, size: 14)),
              ],
            ),
          )),
        )
      ]),
    );
  }

  buildTotalRow(String leading, String price, String description,
      {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customTitleText(leading, size: 14),
        Row(
          children: [
            customTitleText(description, size: 13),
            SizedBox(
              width: 7,
            ),
            SizedBox(
                child: customTitleText(price,
                    size: 14, colors: color ?? Colors.black)),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(color: Color(0XFFF2F2F2)),
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OrdersWidget(),
                ),
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 40,
              child: Row(
                children: [
                  backArrow(Navigator.of(context).pop,
                      color: UIData.kblack, colorIcon: Colors.white),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  customTitleText("Order #1DF9OE",
                      size: 14, colors: Colors.black)
                ],
              )),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.65,
              minChildSize: 0.65,
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
                            top: 24.0, left: 24, right: 24),
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    customTitleText("Orders Details",
                                        colors: UIData.kbrightColor, size: 15),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    buildContainer("BBQ chicken", "N2700", "1"),
                                    buildContainer(
                                        "Pepperoni pie", "N1500", "1"),
                                    buildContainer("Coca-cola", "N200", "2"),
                                    SizedBox(
                                      height: getProportionateScreenHeight(20),
                                    ),
                                    buildTotalRow(
                                      "Subtotal",
                                      "N4000",
                                      "",
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(20),
                                    ),
                                    buildTotalRow("Delivery Fee", "FREE", "499",
                                        color: UIData.kbrightColor),
                                    SizedBox(
                                      height: getProportionateScreenHeight(20),
                                    ),
                                    buildTotalRow("Total", "N4000", "",
                                        color: UIData.kbrightColor),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customTitleText("Credit card",
                                            size: 14),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/icons/credit_icon.png"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                                child: customTitleText(
                                              "1211",
                                              size: 14,
                                            )),
                                          ],
                                        )
                                      ],
                                    )
                                  ])
                            ])));
              }),
          DraggableScrollableSheet(
              maxChildSize: 0.18,
              initialChildSize: 0.18,
              minChildSize: 0.05,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: UIData.kblack,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 24, right: 24),
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 5,
                                    width: getProportionateScreenWidth(35),
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFFFFFF).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              customTitleText("Rate your Order",
                                  colors: Colors.white),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        //mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            5,
                                            (index) => Icon(
                                                  Icons.star,
                                                  color: UIData.kstarIcon,
                                                  size: 30,
                                                )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: UIData.kbrightColor),
                                    child: Center(
                                      child: customDescriptionText("Review",
                                          colors: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ])));
              })
        ])));
  }
}
