import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';

import 'package:foodie/user_screen/screen/invite_friend.dart';

import 'package:foodie/user_screen/screen/profile/digital_payment.dart';
import 'package:foodie/user_screen/screen/profile/my_favourite.dart';
import 'package:foodie/user_screen/screen/profile/offers_promos.dart';
import 'package:foodie/user_screen/screen/profile/profile_edit.dart';
import 'package:foodie/user_screen/screen/profile/saved_address.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

import 'my_wallet.dart';

class NavProfile extends StatelessWidget {
  const NavProfile({Key? key}) : super(key: key);
  static const routeName = "/nav_profile";

  buildListTile(IconData icon, Color color, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: customTitleText(title, size: 15),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
    );
  }

  buildOffersTile(Widget widget, String title) {
    return ListTile(
      leading: widget,
      title: customTitleText(title, size: 15),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
    );
  }

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
              child: Row(
                children: [
                  backArrow(() {
                    Get.back();
                  }, colorIcon: Colors.black),
                  SizedBox(
                    width: getProportionateScreenWidth(30),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTitleText("Dara Obafemi", colors: Colors.white),
                      customDescriptionText("View Profile",
                          colors: Colors.white, onTap: () {
                        Navigator.of(context).pushNamed(ProfileEdit.routeName);
                      })
                    ],
                  )
                ],
              )),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.8,
              minChildSize: 0.8,
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
                              customDescriptionText(
                                "Account",
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(MyWallet.routeName);
                                },
                                child: buildListTile(Icons.person_outline,
                                    UIData.kbrightColor, "My Wallet"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(DigitalPayment.routeName);
                                },
                                child: buildListTile(Icons.credit_card_outlined,
                                    UIData.kbrightColor, "Digital Payment"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(SavedAddress.routeName);
                                },
                                child: buildListTile(
                                    Icons.bookmark_border_outlined,
                                    Colors.amber,
                                    "Saved Address"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(MyFavourite.routeName);
                                },
                                child: buildListTile(
                                    Icons.favorite_border_outlined,
                                    UIData.kbrightColor,
                                    "My Favourites"),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              customDescriptionText(
                                "Offers",
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(OffersAndPromos.routeName);
                                },
                                child: buildOffersTile(
                                    Image.asset("assets/icons/offers.png"),
                                    "Offers & Promos"),
                              ),
                              buildOffersTile(
                                  Image.asset("assets/icons/discount.png"),
                                  "Get Discounts"),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(InviteFriend.routeName);
                                },
                                child: buildOffersTile(
                                    Icon(
                                      Icons.person_add_outlined,
                                      color: Colors.amber,
                                    ),
                                    "Invite a Friend"),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              buildListTile(Icons.settings_outlined,
                                  Colors.grey, "Settings"),
                            ])));
              })
        ])));
  }
}
