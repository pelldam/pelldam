import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
// import 'package:foodie/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'package:foodie/logic/const.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:foodie/user_screen/widget/food_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavSearchScreen extends StatefulWidget {
  NavSearchScreen({Key? key}) : super(key: key);

  @override
  _NavSearchScreenState createState() => _NavSearchScreenState();
}

class _NavSearchScreenState extends State<NavSearchScreen> {
  final _searchcontroller = TextEditingController();
  final controller = Get.find<AuthServices>();

  List data = [];

  Future<List>? category;
  Future<List>? menu;

  Future<List> getCategoryData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var response = await http.get(
        Uri.parse(
            'https://foodgital2.herokuapp.com/food-category/view-all-categories'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $value'
        });

    List<Map<String, dynamic>> res =
        List<Map<String, dynamic>>.from(json.decode(response.body)['response']);

    return res;
  }

  Future<List> getRestuarantMenuData() async {
    final prefs = await SharedPreferences.getInstance();
    String restaurantId = controller.restaurant!.restaurantId;
    print('restaurantId: $restaurantId');
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var response = await http.get(
        Uri.parse(
            'https://foodgital2.herokuapp.com/restaurant-menu/view-restaurant-menu/$restaurantId'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $value'
        });
    List<Map<String, dynamic>> res =
        List<Map<String, dynamic>>.from(json.decode(response.body)['response']);
    return res;
  }

  @override
  void initState() {
    //this.loader = true;
    super.initState();
    menu = getRestuarantMenuData();
    category = getCategoryData();
    //this.loader = false
  }

  buildRow(String name) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.black54,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        customDescriptionText(name)
      ],
    );
  }

  @override
  void dispose() {
    _searchcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final food = DummyFood.toList();
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UIData.kbrightColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  // hoverColor: UIData.kFormColor,
                  fillColor: Colors.black12,
                  filled: true,

                  hintText: 'Search for a dish or resturant...',
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
            DraggableScrollableSheet(
                maxChildSize: 0.8,
                initialChildSize: 0.8,
                minChildSize: 0.8,
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
                      child: FutureBuilder(
                          future: getCategoryData(),
                          builder: (context, AsyncSnapshot<List> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: UIData.kbrightColor,
                                ),
                              );
                            } else if (snapshot.hasData) {
                              return ListView(
                                  controller: controller,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    customTitleText("Recent Searches",
                                        size: 15),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    buildRow("Fried Rice"),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    buildRow("Pizza"),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    buildRow("Shawarma"),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    customTitleText("Categories", size: 15),
                                    SizedBox(
                                      height: getProportionateScreenHeight(30),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data!.length,
                                          controller: controller,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 3 / 2,
                                                  crossAxisCount: 2),
                                          itemBuilder: (BuildContext context,
                                                  index) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FoodCategoryWidget(
                                                    snapshot.data![index]
                                                        ['name'],
                                                    snapshot.data![index].name),
                                              )),
                                    ),
                                  ]);
                            } else if (!snapshot.hasData) {
                              return Center(
                                child: Text(
                                  'No category data found',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          color: UIData.kbackgroundwhite,
                                          fontFamily: "SofiaPro",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
