import 'package:flutter/material.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class PhoneOtpWidget extends StatefulWidget {
  PhoneOtpWidget({Key? key}) : super(key: key);

  @override
  _PhoneOtpWidgetState createState() => _PhoneOtpWidgetState();
}

class _PhoneOtpWidgetState extends State<PhoneOtpWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        customTitleText("Phone Verification"),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        customDescriptionText("Enter your OTP code here")
      ]),
    );
  }
}
