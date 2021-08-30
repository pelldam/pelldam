import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/onboarding_screen/SplashBody.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({required Key key}) : super(key: key);

  static const routeName = "./splashscreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}
