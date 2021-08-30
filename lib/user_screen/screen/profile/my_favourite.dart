import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

enum MyFavourites { Resturants, Dishes }

class MyFavourite extends StatefulWidget {
  MyFavourite({Key? key}) : super(key: key);

  static const routeName = "/my_favourite";

  @override
  _MyFavouriteState createState() => _MyFavouriteState();
}

late MyFavourites myFavourites;

class _MyFavouriteState extends State<MyFavourite> {
  @override
  void initState() {
    myFavourites = MyFavourites.Resturants;
    super.initState();
  }

  void _changeFavourites(MyFavourites newfavourite) {
    setState(() {
      myFavourites = newfavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Cover.png"),
                    fit: BoxFit.cover)),
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
            child: customTitleText("My Favourites", colors: Colors.white),
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FavouriteWidget(
                    label: "Resturants(356)",
                    isSelected: myFavourites == MyFavourites.Resturants,
                    function: () => _changeFavourites(MyFavourites.Resturants),
                  ),
                  FavouriteWidget(
                    label: "Dishes(9)",
                    isSelected: myFavourites == MyFavourites.Dishes,
                    function: () => _changeFavourites(MyFavourites.Dishes),
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.65,
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
                        child: DisplayWidget(
                          displayWidget:
                              myFavourites == MyFavourites.Resturants,
                          child: FavouriteResturant(
                            controller: controller,
                          ),
                          alternateWidget: FavouriteDishes(
                            controller: controller,
                          ),
                        )));
              })
        ])));
  }
}

class DisplayWidget extends StatelessWidget {
  final bool displayWidget;
  final Widget child;
  final Widget alternateWidget;
  const DisplayWidget({
    Key? key,
    this.displayWidget = false,
    required this.child,
    this.alternateWidget = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return displayWidget ? child : alternateWidget;
  }
}

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.function,
  }) : super(key: key);

  final String label;
  final VoidCallback function;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: getProportionateScreenHeight(38),
        width: getProportionateScreenWidth(134),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: customDescriptionText(label, colors: Colors.white),
        ),
      ),
    );
  }
}

class FavouriteResturant extends StatelessWidget {
  const FavouriteResturant({Key? key, required this.controller})
      : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: getProportionateScreenHeight(120),
            width: getProportionateScreenWidth(double.infinity),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/dough.png"),
                      ),
                    )),
                Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitleText("The Dough Factory", size: 14),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    customDescriptionText("4.5",
                                        fontWeight: FontWeight.bold,
                                        colors: Colors.black),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    customDescriptionText("Burger"),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    customDescriptionText("NN"),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(25),
                                  width: getProportionateScreenWidth(80),
                                  decoration: BoxDecoration(
                                      color: UIData.kbrightColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  // child: customDescriptionText("25 -30 min",
                                  child: Center(
                                    child: customDescriptionText("25-30 min",
                                        textAlign: TextAlign.center,
                                        colors: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )
        ]);
  }
}

class FavouriteDishes extends StatelessWidget {
  const FavouriteDishes({Key? key, required this.controller}) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: getProportionateScreenHeight(120),
            width: getProportionateScreenWidth(double.infinity),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage("assets/images/pizza.png"),
                              fit: BoxFit.cover)),
                    )),
                Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitleText("Rodeo Burger", size: 14),
                            customDescriptionText(
                                "Crispy onion rings, tangy BBQ sauce and American cheese",
                                textAlign: TextAlign.left),
                            customTitleText("N 500",
                                size: 14, colors: UIData.kbrightColor),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )
        ]);
  }
}
