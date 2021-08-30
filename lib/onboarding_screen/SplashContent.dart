// ignore: import_of_legacy_library_into_null_safe
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:foodie/logic/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    required this.text,
    //required this.text1,
    required this.image,
    required this.text1,
  });
  final String image;

  final String text, text1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Image.asset(
                image,
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(235),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'SofiaPro',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                text1,
                style: TextStyle(
                    fontFamily: "SofiaPro",
                    fontSize: 13,
                    height: 2,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}
