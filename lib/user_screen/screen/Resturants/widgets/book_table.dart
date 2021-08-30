import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class BookTableWidget extends StatefulWidget {
  BookTableWidget({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  _BookTableWidgetState createState() => _BookTableWidgetState();
}

class _BookTableWidgetState extends State<BookTableWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: getProportionateScreenHeight(130),
              child: Image.asset("assets/images/book_table.png")),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        customDescriptionText("How many people?"),
        Divider(),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                    child: customTitleText("4",
                        colors: UIData.kbrightColor, size: 28)),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: UIData.kbrightColor,
                          ),
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: UIData.kbrightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
