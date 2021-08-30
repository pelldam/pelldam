import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);

  static const routeName = "/.my_wallet";

  @override
  Widget build(BuildContext context) {
    Widget buildContainer() {
      return Container(
        height: 5,
        width: getProportionateScreenWidth(35),
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIData.kbrightColor,
        body: SafeArea(
            child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 40,
              left: 30,
              child: Row(
                children: [
                  backArrow(Navigator.of(context).pop,
                      color: Colors.black, colorIcon: Colors.white),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  customTitleText("My Wallet", size: 14, colors: Colors.white)
                ],
              )),
          Positioned(
              top: 130,
              left: 30,
              right: 30,
              child: Container(
                height: getProportionateScreenHeight(110),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: customTitleText("My Balance",
                              colors: UIData.kbrightColor, size: 14)),
                      Expanded(
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customTitleText(
                                    "N10,000",
                                    size: 18,
                                  ),
                                  customDescriptionText("Available",
                                      fontSize: 13)
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: 30,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.black54.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          DraggableScrollableSheet(
              expand: true,
              maxChildSize: 0.65,
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
                            top: 16.0, left: 16, right: 16),
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                children: [
                                  buildContainer(),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(30),
                              ),
                              customTitleText(
                                "My Cards",
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Container(
                                height: getProportionateScreenHeight(80),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: ListTile(
                                    leading: Container(
                                        width: 30,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF7F7F7),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          size: 13,
                                          color: Colors.black54,
                                        )),
                                    title: customTitleText(
                                      "Add New Card",
                                      colors: Colors.black54,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              )
                            ])));
              })
        ])));
  }
}
