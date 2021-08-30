// ignore: import_of_legacy_library_into_null_safe
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:foodie/authentication_screen/screens/choose_auth.dart';
import 'package:foodie/authentication_screen/screens/signup.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';

import 'package:foodie/onboarding_screen/SplashContent.dart';
import 'package:foodie/repository/auth.dart';
import 'package:get/get.dart';
// import 'package:vrouter/vrouter.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<Map<String, dynamic>> splashData = [
    {
      "image": "assets/onboarding/first.png",
      "text": "All your favourites",
      "text1":
          "Order food online from foodie super fast food\n delivery to your home or office Check menu,\n ratings and reviews",
      "image1": "assets/images/foodgital_white1.png"
    },
    {
      "image": "assets/onboarding/second.png",
      "text": "Unmatched Reliability",
      "text1":
          "Experience peace of mind while tracking your\n order in real time",
      "image1": "assets/images/foodgital_white1.png"
    },
    {
      "image": "assets/onboarding/third.png",
      "text": "Five Stars Riders",
      "text1": "Enjoy delivery from a friendly fleet",
      "image1": "assets/images/foodgital_white1.png"
    },
  ];

  void goAuthPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ChooseAuthScreen.routeName);
  }

  final controllrer = Get.find<AuthServices>();

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
        duration: Duration(
          microseconds: 1000,
        ),
        child: SafeArea(
          child: SizedBox(
              child: Column(children: [
            Expanded(
                flex: 3,
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () => goAuthPage(context),
                              // onTap: () => setState(() => ConnectedRoutes.chooseauth),
                              child: Text(
                                "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: UIData.kbrightColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "SofiaPro"),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        child: Image.asset("assets/images/foodgital_black.png"),
                      )
                    ],
                  ),
                ))),
            Expanded(
              flex: 5,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"],
                        text: splashData[index]["text"],
                        text1: splashData[index]["text1"],
                      )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 2),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            final controller = Get.find<AuthServices>();
                            controller.updateIsFirstTime(false);
                            Get.off(() => SignUpScreen());
                          },
                          child: Container(
                              height: getProportionateScreenHeight(55),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: UIData.kbrightColor,
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity * 0.6,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "Create an account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ])),
        ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.black : Colors.black38,
        //make some changes
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
