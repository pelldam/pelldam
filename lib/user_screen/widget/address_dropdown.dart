import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class AddressDropdown extends StatefulWidget {
  AddressDropdown({Key? key}) : super(key: key);

  @override
  _AddressDropdownState createState() => _AddressDropdownState();
}

class _AddressDropdownState extends State<AddressDropdown> {
  bool isChecked = true;
  final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7),
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          customTitleText("Delivery Address", size: 18),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            height: 50,
            width: getProportionateScreenWidth(500),
            // margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[500]!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16, top: 8),
                          child: Icon(
                            Icons.search,
                            color: Colors.black26,
                          ))),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 16, top: 10),
                    child: TextFormField(
                      // textCapitalization: textCapitalization,
                      cursorColor: UIData.kbrightColor,
                      onTap: () {},
                      autofocus: false,
                      controller: _searchcontroller,
                      // initialValue: initialValue,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      //readOnly: ,
                      keyboardType: TextInputType.name,
                      minLines: 1,

                      decoration: InputDecoration(
                        hintText: "search for an address",
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
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          customTitleText(
            "My Address",
            size: 15,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            height: getProportionateScreenHeight(90),
            width: getProportionateScreenWidth(500),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: UIData.kbrightColor,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "No. 18 Alibaba Crescent, Jabi",
                            style: TextStyle(
                                fontFamily: "SofiaPro",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          customDescriptionText("Abuja")
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 8),
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[500]!.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(13)),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Colors.black26,
                        ),
                      ),
                    ))
              ],
            ),
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
                        "Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
