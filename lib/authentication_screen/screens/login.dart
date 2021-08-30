import 'package:flutter/material.dart';
import 'package:foodie/authentication_screen/widgets/login.dart';

import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/auth.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/sigin';

  final AuthServices authLogin = Get.put(AuthServices());

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
            builder: (BuildContext context, ScrollController scrollController) {
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
                      children: [
                        LoginWidget(),
                      ]));
            })
      ]),
    );
  }
}
