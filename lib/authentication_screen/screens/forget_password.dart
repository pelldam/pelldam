import 'package:flutter/material.dart';

import 'package:foodie/authentication_screen/widgets/forget_password_widget.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forget_password';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

// https://www.figma.com/file/KerShDwVCjINfQD3oZAl64/foodie-App-UI-Last?node-id=0%3A1

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/forget_password.png"),
                fit: BoxFit.contain)),
      ),
      Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: backArrow(() {
            Navigator.of(context).pop();
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
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
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              ForgetPasswordWidget()
            ],
          ),
        ),
      )
    ]);
  }
}
