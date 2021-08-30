import 'package:flutter/material.dart';
import 'package:foodie/authentication_screen/widgets/phone_otp_widget.dart';

import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class PhoneOtp extends StatelessWidget {
  const PhoneOtp({Key? key}) : super(key: key);

  static const routeName = "/.phone_otp";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10),
          child: backArrow(() {
            Navigator.of(context).pop();
          }, colorIcon: Colors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Phone_OTP.png"))),
          ),
          Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/foodgital_white1.png")),

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
                        children: [PhoneOtpWidget()]));
              })
        ])));
  }
}
