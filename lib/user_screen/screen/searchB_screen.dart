import 'package:flutter/material.dart';
import 'package:foodie/dummy_data.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/user_screen/screen/Filters/filter_screen.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  static const routeName = "/searchB";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = DummySearch.toList();

  final _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UIData.kbrightColor,
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _searchcontroller,
                  cursorColor: Colors.white,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    // hoverColor: UIData.kFormColor,
                    fillColor: Colors.black12,
                    filled: true,

                    hintText: 'Burger',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.white),

                    contentPadding:
                        EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(90),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(110),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: customDescriptionText("Resturants(324)",
                                colors: Colors.white, fontSize: 11)),
                      ),
                      Container(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(110),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: customDescriptionText("Dishes(324)",
                                colors: Colors.white, fontSize: 11)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showBarModalBottomSheet(
                              expand: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => FilterScreen());
                        },
                        child: filterContainer(
                          Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.75,
              initialChildSize: 0.75,
              minChildSize: 0.75,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 24.0, left: 24, right: 24),
                      child: ListView(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemCount: search.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SearchResturantWidget(
                                            imageUrl: search[index].imageUrl,
                                            rating: search[index].rating,
                                            name: search[index].name,
                                            distance: search[index].distance),
                                      )),
                            ),
                          ]),
                    ));
              })
        ],
      )),
    );
  }
}

class SearchResturantWidget extends StatelessWidget {
  final String imageUrl;
  final double rating;

  final String name;
  final double distance;

  const SearchResturantWidget(
      {Key? key,
      required this.imageUrl,
      required this.rating,
      required this.name,
      required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Image.asset(
                    imageUrl,
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customTitleText(name, size: 13),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.amber,
                            size: 13,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          customTitleText(rating.toString(), size: 13),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          customDescriptionText("* Burger * ##")
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: getProportionateScreenHeight(20),
                            width: getProportionateScreenWidth(70),
                            decoration: BoxDecoration(
                                color: UIData.kbrightColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: customDescriptionText("25-30 mins",
                                  fontSize: 10, colors: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(8),
                          ),
                          customDescriptionText(distance.toString())
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
