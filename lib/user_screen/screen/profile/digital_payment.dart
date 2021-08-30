import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class DigitalPayment extends StatelessWidget {
  const DigitalPayment({Key? key}) : super(key: key);

  static const routeName = "/.digitalpayment";

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
          child: backArrow(Navigator.of(context).pop, colorIcon: Colors.black),
        ),
        Positioned(
          top: 130,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTitleText("Digital Payment", colors: Colors.white),
              customDescriptionText("pay your bill easily from eneywhere",
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
                      padding:
                          const EdgeInsets.only(top: 32.0, left: 24, right: 24),
                      child: ListView(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          children: [
                            DigitalPaymentWidget(
                                icon: Icons.person_outline,
                                color: UIData.kbrightColor,
                                title: "ACCOUNT SETTIGNS",
                                subtitle: "Change secret PIN or recovery"),
                            Divider(),
                            DigitalPaymentWidget(
                                icon: Icons.receipt,
                                color: UIData.kbrightColor,
                                title: "TRANSACTION HISTORY",
                                subtitle: "List of completed digital payments"),
                            Divider(),
                            DigitalPaymentWidget(
                                icon: Icons.credit_card_outlined,
                                color: Colors.amber,
                                title: "MANAGE PAYMENT",
                                subtitle: "Add or remove card"),
                            Divider(),
                            DigitalPaymentWidget(
                                icon: Icons.help_outline,
                                color: Colors.grey,
                                title: "HELP",
                                subtitle: "Get support or report any issue"),
                            Divider()
                          ])));
            })
      ])),
    );
  }
}

class DigitalPaymentWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  const DigitalPaymentWidget(
      {Key? key,
      required this.icon,
      required this.color,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 60,
          child: Row(children: [
            Container(
              width: 40,
              height: 50,
              decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Icon(icon, color: color),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customDescriptionText(title,
                        colors: Colors.black, fontWeight: FontWeight.bold),
                    customDescriptionText(subtitle)
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
