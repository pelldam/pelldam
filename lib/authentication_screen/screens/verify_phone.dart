import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:foodie/authentication_screen/screens/create_profile.dart';

class VerifyPhoneScreen extends StatefulWidget {
  VerifyPhoneScreen({
    Key? key,
   
  }) : super(key: key);

  static const routeName = "/verify_phone";

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final controller = Get.put(AuthServices());

  String initialCountry = 'NG';

  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
              child: Image.asset(
                "assets/images/foodgital_white1.png",
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/Verify_phone.png"),
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            top: 40,
            left: 40,
            child: backArrow(() => Get.back(), colorIcon: Colors.black),
          ),
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
                        children: [
                          // VerifyPhoneWidget()
                          Padding(
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
                                          selectorType:
                                              PhoneInputSelectorType.DROPDOWN,
                                        ),
                                        ignoreBlank: false,
                                        maxLength: 10,
                                        autoValidateMode:
                                            AutovalidateMode.disabled,
                                        selectorTextStyle:
                                            TextStyle(color: Colors.black),
                                        initialValue: number,
                                        textFieldController:
                                            Get.find<AuthServices>()
                                                .signupPhonenumberController,
                                        formatInput: false,
                                        cursorColor: UIData.kbrightColor,
                                        hintText: "7033295319",
                                        inputDecoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.transparent,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15)),
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                signed: true, decimal: true),
                                        inputBorder: InputBorder.none,
                                        onSaved: (PhoneNumber number) {
                                          number = Get.find<AuthServices>()
                                                  .signupPhonenumberController
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
                                  
                   
                                    Get.to(CreateProfileScreen());
                                  },
                                  child: Container(
                                      height: getProportionateScreenHeight(55),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: UIData.kbrightColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                          ),
                        ]));
              })
        ]));
  }
}
//}
