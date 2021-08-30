import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  static const routeName = "./trans_history";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIData.kbrightColor,
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.transparent,
          ),
          Positioned(
            top: 50,
            left: 40,
            child:
                backArrow(Navigator.of(context).pop, colorIcon: Colors.black),
          ),
          Positioned(
            top: 50,
            right: 40,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: UIData.kbrightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                )),
          ),
          Positioned(
            top: 130,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTitleText("Transaction history", colors: Colors.white),
                customDescriptionText("Here is your all Transaction history",
                    colors: UIData.klightColor)
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.75,
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
                              customDescriptionText("29 March 2021"),
                              SizedBox(
                                height: getProportionateScreenHeight(30),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                title: customTitleText(
                                    "Payment For Street Burger",
                                    size: 14),
                                subtitle: customDescriptionText(
                                    "02:16 PM, 29 March 2021"),
                                trailing: customTitleText("N4000.00",
                                    size: 14, colors: UIData.kbrightColor),
                              ),
                              Divider(
                                thickness: 1,
                              )
                            ])));
              })
        ])));
  }
}
