import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  buildRow(Widget widget, String title, Color color, Color backColor) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backColor,
          ),
          child: Center(child: widget),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        customTitleText(title, colors: color, size: 15)
      ],
    );
  }

  buildContainer(String currency, Color backColor) {
    return Container(
      height: getProportionateScreenHeight(60),
      width: getProportionateScreenWidth(90),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: customDescriptionText(currency, fontSize: 23),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTitleText(
            "Sort By",
            size: 18,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildRow(
            Image.asset("assets/icons/fire.png"),
            "Most Popular",
            UIData.kbrightColor,
            UIData.kbrightColor.withOpacity(0.1),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildRow(
              Icon(
                Icons.access_time,
              ),
              "Delivery Time",
              Colors.black38,
              UIData.klightColor),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildRow(
              Icon(
                Icons.star_border_outlined,
                color: Colors.black38,
              ),
              "Rating",
              Colors.black38,
              UIData.klightColor),
          SizedBox(
            height: getProportionateScreenHeight(35),
          ),
          customTitleText("Price Range", size: 18),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(
                "₦",
                UIData.kbrightColor.withOpacity(0.1),
              ),
              buildContainer("₦₦", UIData.klightColor),
              buildContainer("₦₦₦", UIData.klightColor)
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  height: getProportionateScreenHeight(55),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: UIData.kbrightColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: getProportionateScreenWidth(500),
                  child: Center(
                    child: Container(
                      child: Text(
                        "Apply Filter",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          )
        ],
      ),
    );
  }
}
