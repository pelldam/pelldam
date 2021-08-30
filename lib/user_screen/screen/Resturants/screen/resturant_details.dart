import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/restaurant_model.dart';
import 'package:foodie/repository/cart_respository.dart';
import 'package:foodie/repository/food_menu_repository.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/resturantMainchip.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/resturantSubchip.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/resturant_floating_container.dart';
import 'package:foodie/user_screen/screen/cart_screen.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/book_table.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/delivery_menuItem.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/pickUp_menuItem.dart';
import 'package:foodie/user_screen/screen/Resturants/widgets/reviews_ratings.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

Size? size;

//Controls the three TabBars
enum MainAction { DELIVERY, PICK_UP, BOOK_TABLES }

//Controls the two tabBar after
enum SubAction { MENU_ITEMS, REVIEWS_RATINGS }

class   ResturantDetails extends StatefulWidget {

  ResturantDetails({Key? key,}) : super(key: key);
  static const routeName = "/resturantDetails";

  @override
  _ResturantDetailsState createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  //An instance of the chips
  late MainAction currentMainAction;
  late SubAction currentSubAction;
  final foodMenuController=Get.find<FoodMenuRepository>();
  final cartController=Get.find<CartRespository>();

  // initializing the chips in initState to..
  @override
  void initState() {
    currentMainAction = MainAction.DELIVERY;
    currentSubAction = SubAction.MENU_ITEMS;
    super.initState();
  }

// A function that takes an instance of the three Main chips and switch the current chip depending on the ontap
  void changeMainAction(MainAction newAction) {
    setState(() {
      currentMainAction = newAction;
    });
  }
// A function that takes an instance of the two  subain chips and switch the current chip depending on the ontap

  void changeSubAction(SubAction newAction) {
    setState(() {
      currentSubAction = newAction;
    });
  }

  // Creating the layout (UI) of the two subchips
  Widget _subChips() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MarketSubChip(
            isSelected: currentSubAction == SubAction.MENU_ITEMS,
            label: 'Menu Items',
            onChanged: () => changeSubAction(SubAction.MENU_ITEMS),
          ),
          MarketSubChip(
            isSelected: currentSubAction == SubAction.REVIEWS_RATINGS,
            label: 'Reviews & Ratings',
            onChanged: () => changeSubAction(SubAction.REVIEWS_RATINGS),
          ),
        ],
      ),
    );
  }

  // Creating the layout (UI) of the three(3) main chips
  Widget _mainChips() {
    return Container(
      height:
          size!.height / 16, // Used to manage the height of the main chips..
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResturantChip(
            icon: Icons.two_wheeler,
            label: 'Delivery',
            isSelected: currentMainAction == MainAction.DELIVERY,
            onChanged: () => changeMainAction(MainAction.DELIVERY),
          ),
          ResturantChip(
            icon: Icons.local_mall,
            label: 'Pick up',
            isSelected: currentMainAction == MainAction.PICK_UP,
            onChanged: () => changeMainAction(MainAction.PICK_UP),
          ),
          ResturantChip(
            icon: Icons.event_available_outlined,
            label: 'BookTable',
            isSelected: currentMainAction == MainAction.BOOK_TABLES,
            onChanged: () => changeMainAction(MainAction.BOOK_TABLES),
          ),
        ],
      ),
    );
  }

  // This UI renders the content of the tabBars depending on which one is clickedcalling a method called DisplayWidget

  Widget _mainContent(ScrollController scrollController) {
    return Expanded(
      child: DisplayWidget(
        displayWidget: currentMainAction == MainAction.DELIVERY,
        //For the first main chip Delivery
        child: Column(
          children: [
            _subChips(),
            SizedBox(
              height: 10,
            ),
            _subContentDelivery(scrollController),
          ],
        ),
        alternateWidget: DisplayWidget(

            // For the pickUp chip
            displayWidget: currentMainAction == MainAction.PICK_UP,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customDescriptionText("Pick up time"),
                        customTitleText("Set",
                            size: 14, colors: UIData.kbrightColor),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    customTitleText("01:00pm",
                        colors: UIData.kbrightColor, size: 25),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    customDescriptionText("24 September, 2021"),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            _subChips(),
                            SizedBox(height: 5),
                            _subContentPickUp(scrollController),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // For the BookTable chip
            alternateWidget: BookTableWidget(
              controller: scrollController,
            )),
      ),
      // child: Container(),
    );
  }

  // This UI renders the content of the two sub tabBars for the Delivery Tab

  Widget _subContentDelivery(ScrollController scrollController) {
    return Expanded(
      child: DisplayWidget(
          displayWidget: currentSubAction == SubAction.MENU_ITEMS,
          child: DeliveryManuItem(
            controller: scrollController,
          ),
          alternateWidget: ReviewsAndRatings(
            controller: scrollController,
          )),
    );
  }

  // This UI renders the content of the two sub tabBars for the PickUp Tab
  Widget _subContentPickUp(ScrollController scrollController) {
    return Expanded(
      child: DisplayWidget(
          displayWidget: currentSubAction == SubAction.MENU_ITEMS,
          child: PickupMenuItem(
            controller: scrollController,
          ),
          alternateWidget: ReviewsAndRatings(
            controller: scrollController,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/Cover.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          Positioned(
              top: 30,
              left: 40,
              child: backArrow(Navigator.of(context).pop,
                  colorIcon: Colors.black)),
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
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                )),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.8,
            initialChildSize: 0.8,
            minChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 125.0, left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      _mainChips(),
                      SizedBox(height: 10),
                      _mainContent(scrollController),
                    ],
                  ),
                ),
              );
            },
          ),
          Obx(()
           {
             if(cartController.cartList.isNotEmpty){
              var cartNumber=cartController.cartList.length;
              return Positioned(
                bottom: 40,
                left: 10,
                right: 10,
                child: DisplayWidget(
                  displayWidget: currentMainAction ==
                      MainAction.DELIVERY, //For the first main chip Delivery
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(CartScreen.routeName);
                    },
                    child: Container(
                        height: getProportionateScreenHeight(55),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: UIData.kbrightColor,
                            borderRadius: BorderRadius.circular(10)),
                        width: getProportionateScreenWidth(500),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              customTitleText("Go to cart",
                                  colors: Colors.white, size: 15),
                              customDescriptionText(cartNumber>1 ?"$cartNumber items": "$cartNumber item",
                                  colors: Colors.white, fontSize: 13)
                            ],
                          ),
                        )),
                  ),
                ),
              );
            }else{

              return Container();
            }
           }
          ),
          Positioned(
            top: 100,
            left: 50,
            right: 50,
            child: Align(
              alignment: Alignment.center,
              child: ResturantFloatingContainer(),
            ),
          )
        ],
      )),
    );
  }
}

// This class is the logic responding in switching the screens depending on the tabs
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
