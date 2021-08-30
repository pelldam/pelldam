import 'package:flutter/material.dart';
import 'package:foodie/user_screen/screen/food_category_screen.dart';

class FoodWidget extends StatefulWidget {
  final String image;
  final String name;

  FoodWidget(this.image, this.name);

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FoodCategoriesScreen.routeName);
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "SofiaPro", fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}
