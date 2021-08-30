import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';

import 'package:foodie/logic/size_config.dart';
import 'package:foodie/user_screen/screen/nav_screen.dart';
import 'package:get/get.dart';

class DeliveryWidget extends StatefulWidget {
  DeliveryWidget({Key? key}) : super(key: key);

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  final _adresscontroller = TextEditingController();

  @override
  void dispose() {
    _adresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: [
      SizedBox(
        height: getProportionateScreenHeight(40),
      ),
      Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                      child: Icon(
                        Icons.location_on,
                        color: UIData.kbrightColor,
                      ))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, right: 16, top: 10),
                child: TextFormField(
                  // textCapitalization: textCapitalization,
                  cursorColor: UIData.kbrightColor,
                  onTap: () {},
                  autofocus: false,
                  controller: _adresscontroller,
                  // initialValue: initialValue,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  //readOnly: ,
                  keyboardType: TextInputType.name,
                  minLines: 1,

                  decoration: InputDecoration(
                    hintText: "Enter a new address",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                    // prefixIcon: prefixIcon,

                    counter: Offstage(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 28,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.near_me_outlined,
              color: UIData.kbrightColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Use current location",
              style: TextStyle(fontFamily: "SofiaPro"),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 28,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: getProportionateScreenHeight(100),
        decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.access_time,
                color: UIData.kbrightColor,
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 16.0, top: 16.0, bottom: 16.0, left: 8.0),
                  child: Container(
                    child: Text(
                      "No. 18 Alibaba Crescent, Jabi\nAbuja, Nigeria",
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 1.3),
                    ),
                  ),
                ))
          ],
        ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(40),
      ),
      GestureDetector(
        onTap: () {
          Get.offAll(UserNavScreen());
        },
        child: Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: UIData.kbrightColor,
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity * 0.6,
            child: Center(
              child: Container(
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ),
      SizedBox(
        height: getProportionateScreenHeight(30),
      ),
    ]);
  }
}
