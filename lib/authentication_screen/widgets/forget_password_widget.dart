import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';

import 'package:foodie/widget/customWidgets.dart';

class ForgetPasswordWidget extends StatefulWidget {
  ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTitleText(
                    "ForgetPassword",
                    textAlign: TextAlign.start,
                    colors: Colors.black,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  customDescriptionText(
                    "Please enter your email address. You will receive a link to create a new password via email.",
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[500]!.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity * 0.6,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                          cursorColor: UIData.kbrightColor,
                          onTap: () {},
                          autofocus: false,
                          controller: _controller,
                          // initialValue: initialValue,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                          //readOnly: ,
                          keyboardType: TextInputType.emailAddress,
                        )),
                      ))),
                  SizedBox(
                    height: getProportionateScreenHeight(250),
                  ),
                  Container(
                      height: getProportionateScreenHeight(55),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: UIData.kbrightColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity * 0.6,
                      child: Center(
                        child: Container(
                          child: Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
