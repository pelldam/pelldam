import 'package:flutter/material.dart';
import 'package:foodie/widget/customWidgets.dart';

class FoodCategoryWidget extends StatelessWidget {
  final String image;
  final String name;
  FoodCategoryWidget(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.yellow, shape: BoxShape.circle,),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        color: Colors.black54,
                        child: customTitleText(name,
                            colors: Colors.white, size: 13))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
