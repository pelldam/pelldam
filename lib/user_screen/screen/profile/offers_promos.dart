import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class OffersAndPromos extends StatefulWidget {
  OffersAndPromos({Key? key}) : super(key: key);

  static const routeName = "/offers_promos";
  @override
  _OffersAndPromosState createState() => _OffersAndPromosState();
}

final _controller = TextEditingController();

@override
void dispose() {
  _controller.dispose();
}

class _OffersAndPromosState extends State<OffersAndPromos> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIData.kbrightColor,
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.transparent,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTitleText("Offers & Promos", colors: Colors.white),
                customDescriptionText("Enter your promo code and get Discount",
                    colors: UIData.klightColor)
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.7,
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
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              customDescriptionText("Enter your promo code",
                                  colors: Colors.black54),
                              SizedBox(
                                height: getProportionateScreenHeight(30),
                              ),
                              Container(
                                  height: 60,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[500]!.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: double.infinity * 0.6,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: (TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      cursorColor: UIData.kbrightColor,
                                      onTap: () {},
                                      autofocus: false,
                                      controller: _controller,
                                      // initialValue: initialValue,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                      //readOnly: ,
                                      keyboardType: TextInputType.emailAddress,
                                    )),
                                  ))),
                            ])));
              })
        ])));
  }
}
