import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/user_screen/screen/nav_screen.dart';
import 'package:foodie/onboarding_screen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodie/authentication_screen/screens/signup.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = "/first_screen";
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // ignore: unused_element
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  // ignore: unused_field
  Timer? _timer;
  final controller = Get.find<AuthServices>();
  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 3000), () {
      if (controller.status == Status.IS_FIRST_TIME) {
        Get.off(() => SplashScreen());
      } else if (controller.status == Status.Authenticated) {
        Get.off(() => UserNavScreen());
      } else {
        Get.off(() => SignUpScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/global/logo.png"),
            )
          ],
        ),
      ),
    );
  }
}
