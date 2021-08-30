import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/restaurant_model.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/user_screen/screen/Filters/filter_screen.dart';
import 'package:foodie/user_screen/screen/latest_offers_screen.dart';
import 'package:foodie/user_screen/screen/searchB_screen.dart';
import 'package:foodie/user_screen/widget/address_dropdown.dart';
// import 'package:foodie/widget/restWidget.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:foodie/widget/foodWidget.dart';
import 'package:foodie/widget/restWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../dummy_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<AuthServices>();
  final restuarantController=Get.find<RestaurantRepository>();
  final _searchcontroller = TextEditingController();
  // final selected = DummyResturants.toList();
  // final food = DummyFood.toList();
  List data = [];

  Future<List>? category;
  Future<List>? menu;
  Future<List>? restaurants;

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

  Future<List> getRestaurantMenuData() async {
    final prefs = await SharedPreferences.getInstance();
    String restaurantId = controller.restaurant!.restaurantId;
    print('restuarantId: $restaurantId');
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

  Future<List> getRestaurantNearBy() async {
    final prefs = await SharedPreferences.getInstance();
    Restaurant? longitude = controller.longitude;
    Restaurant? latitude = controller.latitude;
    print('longitude: $longitude');
    print('latitude: $latitude');
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    var response = await http.get(
        Uri.parse(
            'http://foodgital2.herokuapp.com/restaurant/view-nearby-restaurants/'),
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
    // menu = getRestaurantMenuData();
    // category = getCategoryData();
    // restaurants = getRestaurantNearBy();
    //this.loader = false
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showBarModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AddressDropdown());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "No. 18 Alibaba Crescent, Jabi",
                            style: TextStyle(
                                fontFamily: "SofiaPro", color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: UIData.kbrightColor,
                            size: 27,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SearchScreen.routeName);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            height: 40,
                            //  width: getProportionateScreenWidth(100),
                            decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: IgnorePointer(
                                child: TextField(
                                  // textCapitalization: textCapitalization,
                                  cursorColor: UIData.kbrightColor,
                                  onTap: () {},
                                  autofocus: false,
                                  controller: _searchcontroller,

                                  // initialValue: initialValue,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                  //readOnly: ,
                                  keyboardType: TextInputType.name,
                                  minLines: 1,

                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Icon(
                                        Icons.search,
                                        color: UIData.kbrightColor,
                                      ),
                                    ),
                                    counter: Offstage(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            showBarModalBottomSheet(
                                expand: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => FilterScreen());
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: UIData.kbrightColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.filter_list_alt,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: getProportionateScreenHeight(150),
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
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:0,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: FoodWidget(
                                          "",
                                          "foodies",
                                    )));
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

                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  // will be a new widget too
                  LayoutBuilder(builder: (context, constraints) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(LatestOfferScreen.routeName);
                        },
                        child: Container(
                          height: 110,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF1A6164),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 0,
                                  top: -100,
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFACD5C)),
                                  )),
                              Positioned(
                                left: -30,
                                bottom: -100,
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Color(0xFFFF574D).withOpacity(0.8)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  // const widget here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleText("Resturants nearby ",
                          size: 15, colors: UIData.kbrightColor),
                      customDescriptionText("show all")
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  Container(
                    color: Colors.transparent,
                    height: getProportionateScreenHeight(250),
                    child: Obx(()
                        {
                          if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.Loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: UIData.kbrightColor,
                              ),
                            );
                          } else if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.RestuarantAvailable) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:restuarantController.nearByresturantList.length,
                              itemBuilder: (BuildContext context, index){
                            var value=  restuarantController.nearByresturantList[index];
                            print("value is ${value.restaurantName}");
                              if(value.restaurantName!.isNotEmpty)
                               return   Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ResturantWidget(
                                        value
                                       
                                      )));
                            
                               return Container();
                              }
                              
                              );
                              
                              
                          
                          } else if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.NotRestaurantAvailable) {
                            return Center(
                              child: Text(
                                'No category found',
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

                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleText("Popular Resturants",
                          size: 15, colors: UIData.kbrightColor),
                      customDescriptionText("show all")
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  Container(
                    color: Colors.transparent,
                    height: getProportionateScreenHeight(250),
                    child: Obx(()
                        {
                          if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.Loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: UIData.kbrightColor,
                              ),
                            );
                          } else if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.RestuarantAvailable) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:restuarantController.nearByresturantList.length,
                              itemBuilder: (BuildContext context, index) =>
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ResturantWidget(
                                         restuarantController.nearByresturantList[index]
                                       
                                      ))),
                            );
                          } else if (restuarantController.nearbyRestaurantStatus==NearbyRestaurantStatus.NotRestaurantAvailable) {
                            return Center(
                              child: Text(
                                'No category found',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
