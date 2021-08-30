import 'package:flutter/material.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/restaurant_model.dart';
import 'package:foodie/repository/restuarant_repository.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodie/user_screen/screen/Resturants/screen/resturant_details.dart';
import 'package:get/get.dart';

class ResturantWidget extends StatefulWidget {

final Restaurant? restaurant;

  ResturantWidget(
  this.restaurant
  );

  @override
  _ResturantWidgetState createState() => _ResturantWidgetState();
}

class _ResturantWidgetState extends State<ResturantWidget> {
  final restauranController=Get.find<RestaurantRepository>();
  @override
  Widget build(BuildContext context) {
    //final List selected = DummyResturants;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed(ResturantDetails.routeName);
          restauranController.setCurrentRestaurant(widget.restaurant!);
          Get.toNamed(ResturantDetails.routeName);
        },
        child: Container(
          width: getProportionateScreenWidth(300),
          // height: getProportionateScreenHeight(400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl:(widget.restaurant!.images!.isNotEmpty)? widget.restaurant!.images!.first:"",
                  width: getProportionateScreenWidth(300),
                  height: getProportionateScreenHeight(150),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTitleText(widget.restaurant!.restaurantName!, size: 15),
                    const SizedBox(
                      height: 5,
                    ),
                    customDescriptionText("No description"),
                    const SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Color(0xFFFACD5D),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              '0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "(0 ratings)",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Positioned(
                            right: 2,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
