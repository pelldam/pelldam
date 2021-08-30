import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/user_screen/widget/delivery.dart';

import 'package:foodie/widget/customWidgets.dart';

class DeliveryScreen extends StatefulWidget {
  DeliveryScreen({Key? key}) : super(key: key);
  static const routeName = '/delivery_screen';

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: backArrow(() {
            Navigator.of(context).pop();
          }, colorIcon: Colors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Container(
            color: UIData.kbrightColor,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  customTitleText(
                    "Delivery Details",
                    colors: Colors.black,
                  ),
                ],
              )),

          // Positioned(child: child),
          DraggableScrollableSheet(
              maxChildSize: 0.7,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        children: [DeliveryWidget()]));
              })
        ])));
  }
}
