import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/categories.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.7,
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
                  ),
                );
              }),
        ],
      ),
    );
  }
}
