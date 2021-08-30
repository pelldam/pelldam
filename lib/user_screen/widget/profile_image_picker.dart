import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';

class ProfileImagePicker extends StatefulWidget {
  ProfileImagePicker({Key? key}) : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      width: getProportionateScreenWidth(100),
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            child: Container(
              height: getProportionateScreenHeight(80),
              width: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                  color: UIData.klightColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: UIData.kbrightColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
