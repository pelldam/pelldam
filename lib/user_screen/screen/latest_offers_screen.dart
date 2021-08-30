import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

import '../../dummy_data.dart';

class LatestOfferScreen extends StatelessWidget {
  const LatestOfferScreen({Key? key}) : super(key: key);

  static const routeName = "/latestOffer";

  @override
  Widget build(BuildContext context) {
    final food = DummyFood1.toList();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/latest_offers.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 40, left: 40, child: backArrow(Navigator.of(context).pop)),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  customTitleText("Latest Offers",
                      colors: Colors.white, size: 28),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  customDescriptionText(
                      "Find out the latest discount for your meals",
                      colors: UIData.klightColor)
                ],
              )),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 24, right: 24),
                    child: ListView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: UIData.kbrightColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            customTitleText("24 Restaurants nearby",
                                size: 13, colors: UIData.kbrightColor)
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: food.length,
                              controller: controller,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, index) =>
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LatestOfferWidget(
                                          image: food[index].imageUrl,
                                          rating: food[index].rating,
                                          name: food[index].resturant))),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}

class LatestOfferWidget extends StatelessWidget {
  final String image;
  final double rating;
  final String name;

  const LatestOfferWidget(
      {Key? key, required this.image, required this.rating, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: getProportionateScreenHeight(260),
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      height: getProportionateScreenHeight(25),
                      width: getProportionateScreenWidth(80),
                      child: Center(
                        child: customTitleText("25-30min", size: 13),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTitleText(name, size: 15),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              customTitleText(rating.toString(), size: 15),
                            ],
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(15),
                          ),
                          customDescriptionText("Dishes"),
                          SizedBox(
                            width: getProportionateScreenWidth(15),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(15),
                          ),
                          customDescriptionText("NNN"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  borderRadius: BorderRadius.circular(5)),
                              height: getProportionateScreenHeight(10),
                              width: getProportionateScreenWidth(80),
                              child: Center(
                                child: customDescriptionText("25-30min"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
