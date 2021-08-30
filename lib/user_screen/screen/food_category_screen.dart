import 'package:flutter/material.dart';
import 'package:foodie/dummy_data.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class FoodCategoriesScreen extends StatefulWidget {
  const FoodCategoriesScreen({Key? key}) : super(key: key);

  static const routeName = "/FoodScreen";

  @override
  _FoodCategoriesScreenState createState() => _FoodCategoriesScreenState();
}

class _FoodCategoriesScreenState extends State<FoodCategoriesScreen> {
  final food = DummyFood1.toList();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/categories.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  customTitleText("Burger", colors: Colors.white, size: 28),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  customDescriptionText("Best choices for you",
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
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 40,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  filterContainer(UIData.kbrightColor),
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
                                          customDescriptionText("Trending",
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
                                          customDescriptionText("Recomended",
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          customDescriptionText("Ratings",
                                              colors: Colors.white,
                                              fontSize:
                                                  11), // Rewrite this code

                                          customDescriptionText("X",
                                              colors: Colors.white)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(40),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                itemCount: food.length,
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FoodWidget(
                                          imageUrl: food[index].imageUrl,
                                          rating: food[index].rating,
                                          name: food[index].name,
                                          resturant: food[index].resturant,
                                          time: food[index].time,
                                          amount: food[index].amount),
                                    )),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
          Positioned(
              top: 30, left: 40, child: backArrow(Navigator.of(context).pop)),
          Positioned(
            top: 30,
            right: 40,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: UIData.kbrightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      )),
    );
  }
}

class FoodWidget extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String resturant;

  final String name;
  final double time;
  final double amount;

  const FoodWidget(
      {Key? key,
      required this.imageUrl,
      required this.rating,
      required this.name,
      required this.resturant,
      required this.time,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              imageUrl), // "assets/images/Burger.png"
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTitleText(name, spacing: -1.0, size: 15),
                        SizedBox(
                          height: 5,
                        ),
                        customDescriptionText(resturant, fontSize: 13),
                        SizedBox(
                          height: 5,
                        ),
                        customTitleText("# $amount", spacing: -1.0, size: 15),
                        SizedBox(
                          height: 5,
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
                              customDescriptionText(rating.toString()),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              customDescriptionText(time.toString())
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: 1,
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: customDescriptionText("Add +", spacing: -1),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
