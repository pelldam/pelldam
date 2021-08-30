import 'package:flutter/material.dart';
import 'package:foodie/authentication_screen/screens/login.dart';
import 'package:foodie/authentication_screen/screens/signup.dart';
import 'package:foodie/authentication_screen/widgets/background.dart';

import 'package:foodie/logic/size_config.dart';
import 'package:get/get.dart';
// import 'package:vrouter/vrouter.dart';

class ChooseAuthScreen extends StatelessWidget {
  static const routeName = '/choose_auth';

  Widget buildfacebookbutton(String text, Color color, String icon) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      width: double.infinity * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
        child: Row(
          children: [
            Image.asset(icon),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildlocalauthbutton(String text, Color color, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          width: double.infinity * 0.6,
          child: Center(
            child: Container(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        BackgroundScreen(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(120),
                ),
                Align(
                  child: Image.asset(
                    "assets/images/foodgital_white1.png",
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: buildfacebookbutton(
                            "Sign in with Google",
                            Color(0xFFE3411F),
                            "assets/images/google_circle-512 1.png"),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      buildlocalauthbutton("Sign up", Color(0xFFFF574D), () {
                        // Navigator.of(context).pushReplacementNamed(
                        //     LoginScreen.routeName,
                        //     arguments: "Sign up");
                        Get.to(SignUpScreen());
                      }),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      // Would write a particular code here later

                      buildlocalauthbutton(
                          "Sign in", Color(0xFFFFFFFF).withOpacity(0.1), () {
                        Get.to(LoginScreen());
                      }),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                    ],
                  ),
                )
              ],
            ))),
      ],
    );
  }
}
