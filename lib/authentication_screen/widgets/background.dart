import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/onboarding/chooseAuth.png"),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF2D2D2D).withOpacity(0.8)),
      ),
    );
  }
}
