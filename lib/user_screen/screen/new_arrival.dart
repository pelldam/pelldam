import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class NewArrivalsScreen extends StatefulWidget {
  NewArrivalsScreen({Key? key}) : super(key: key);

  @override
  _NewArrivalsScreenState createState() => _NewArrivalsScreenState();
}

class _NewArrivalsScreenState extends State<NewArrivalsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Image.asset(
            "assets/images/Cover.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  customTitleText("New Arrivals",
                      colors: Colors.white, size: 28),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  customDescriptionText("Brand new Restaurant around you",
                      colors: UIData.klightColor)
                ],
              )),

          // Positioned(child: child),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
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
                          Column(children: [
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Container(
                                height: 40,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                        height:
                                            getProportionateScreenHeight(40),
                                        width: getProportionateScreenWidth(40),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: UIData.kbrightColor)),
                                        child: Center(
                                            child: Icon(
                                          Icons.filter_list_rounded,
                                          color: UIData.kbrightColor,
                                        ))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(100),
                                      decoration: BoxDecoration(
                                          color: UIData.kbrightColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            customDescriptionText("Delivery",
                                                colors: Colors.white,
                                                fontSize:
                                                    11), // Rewrite this code

                                            customDescriptionText("X",
                                                colors: Colors.white)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(110),
                                      decoration: BoxDecoration(
                                          color: UIData.kbrightColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            customDescriptionText(
                                                "New Arrivals",
                                                colors: Colors.white,
                                                fontSize:
                                                    11), // Rewrite this code

                                            customDescriptionText("X",
                                                colors: Colors.white)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(90),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.black54),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            customDescriptionText("Ratings",
                                                fontSize:
                                                    11), // Rewrite this code

                                            customDescriptionText(
                                              "X",
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: NewArrivalWidget(),
                                ),
                              ),
                            ),
                          ])
                        ]));
              })
        ])));
  }
}

class NewArrivalWidget extends StatelessWidget {
  const NewArrivalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image.asset("assets/images/new_arrival.png"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTitleText("The Hungry Man", size: 13),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            customDescriptionText("Burger", fontSize: 12),
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
                            customDescriptionText("Pasta", fontSize: 12),
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
                            customDescriptionText("Rice", fontSize: 12),
                          ],
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customDescriptionText("5.0", fontSize: 12),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            customDescriptionText("56Mins", fontSize: 12)
                          ],
                        ),
                      ),
                      customDescriptionText("1000 OFF - Use Code XMLDW9")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
