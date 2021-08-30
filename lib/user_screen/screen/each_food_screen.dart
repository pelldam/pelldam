import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class EachFoodScreen extends StatefulWidget {
  EachFoodScreen({Key? key}) : super(key: key);

  @override
  _EachFoodScreenState createState() => _EachFoodScreenState();
}

class _EachFoodScreenState extends State<EachFoodScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: backArrow(() {
            Navigator.of(context).pop();
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/eachfood.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: UIData.kbrightColor),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        customTitleText("Burger",
                            size: 25, colors: Colors.white),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        customDescriptionText("Best Choices for you",
                            colors: Colors.white)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(25))),
                  child: Container()),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            )
          ],
        ),
      ),
    );
  }
}
