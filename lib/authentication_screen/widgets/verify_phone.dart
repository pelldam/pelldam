import 'package:flutter/material.dart';

import 'package:foodie/authentication_screen/screens/create_profile.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class VerifyPhoneWidget extends GetView {
  @override
  Widget build(BuildContext context) {
    String initialCountry = 'NG';
    PhoneNumber number = PhoneNumber(isoCode: 'NG');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTitleText(
            "Verify your phone number",
            textAlign: TextAlign.start,
            colors: Colors.black,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          customDescriptionText(
            "We have sent you an SMS with a code to\n number (+234) 7033295319",
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[500]!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {},
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  ignoreBlank: false,
                  maxLength: 10,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller.signupPhonenumberController,
                  formatInput: false,
                  cursorColor: UIData.kbrightColor,
                  hintText: "7033295319",
                  inputDecoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.only(bottom: 15)),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: InputBorder.none,
                  onSaved: (PhoneNumber number) {
                    number = controller.signupPhonenumberController.text
                        as PhoneNumber;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
          GestureDetector(
            onTap: () {
              Get.to(CreateProfileScreen(), arguments: {
                'username': Get.arguments['username'],
                'email': Get.arguments['email'],
                'password': Get.arguments['password'],
                'phoneNumber': controller.signupPhonenumberController
              });
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
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          )
        ],
      ),
    );
  }
}
