import 'package:flutter/material.dart';

import 'package:foodie/authentication_screen/widgets/signup.dart';

import 'package:foodie/logic/size_config.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/signup_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
              child: Image.asset(
                "assets/images/foodgital_white1.png",
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/Cover.png"),
                  fit: BoxFit.cover,
                ),
              )),
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
                        children: [SignUpWidget()]));
              })
        ]));
  }
}
