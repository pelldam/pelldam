import 'package:flutter/material.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class ReviewsAndRatings extends StatelessWidget {
  const ReviewsAndRatings({Key? key, required this.controller})
      : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      separatorBuilder: (context, index) => Divider(),
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: getProportionateScreenHeight(100),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, bottom: 24),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/review.png"))),
                            ),
                          )),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customTitleText("Dotun Oyinlade", size: 13),
                              Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                        5,
                                        (index) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 13,
                                            )),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(8),
                                  ),
                                  customDescriptionText("April 14 2021",
                                      fontSize: 12),
                                ],
                              ),
                              customDescriptionText(
                                  "The food at Dough Factory is amazing. It’s really what everyone says about it.",
                                  colors: Colors.black,
                                  fontSize: 12),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
