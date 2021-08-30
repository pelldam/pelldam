import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class InviteFriend extends StatefulWidget {
  InviteFriend({Key? key}) : super(key: key);

  static const routeName = "./invite_friend";

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

final _controller = TextEditingController();

@override
void dispose() {
  _controller.dispose();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIData.kbrightColor,
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.transparent,
          ),
          Positioned(
            top: 50,
            left: 40,
            child:
                backArrow(Navigator.of(context).pop, colorIcon: Colors.black),
          ),
          Positioned(
            top: 130,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTitleText("Invite a Friend", colors: Colors.white),
                customDescriptionText("Invite your friend and get promo code",
                    colors: UIData.klightColor)
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.7,
              minChildSize: 0.65,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 24, right: 24),
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              customTitleText("Invite Friends & get discount",
                                  size: 22),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              customDescriptionText(
                                  "Share this code with a friend who hasn’t tried foodie. Your friend gets discounts on the first five food delivery, while you get a discount after your friend enjoys the five food delivery service."),
                              SizedBox(
                                height: getProportionateScreenHeight(40),
                              ),
                              customDescriptionText("Your invitation code"),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
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
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
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
                            ])));
              }),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
                height: getProportionateScreenHeight(55),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: getProportionateScreenHeight(55),
                        decoration: BoxDecoration(
                            color: UIData.kbrightColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Icon(
                          Icons.copy_outlined,
                          color: UIData.kbrightColor,
                        )),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: UIData.kbrightColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/Shape.png",
                                color: Colors.white,
                              ),
                              customTitleText("Share",
                                  size: 14, colors: Colors.white) // ShareIcon
                            ],
                          ),
                        ),
                        height: getProportionateScreenHeight(55),
                      ),
                    ),
                  ],
                )),
          ),
        ])));
  }
}
