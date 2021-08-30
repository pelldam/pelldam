import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/repository/order_respository.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UpComingOrderScreen extends GetView<OrderRespository> {
  const UpComingOrderScreen({Key? key}) : super(key: key);

  static const routeName = "/.upcomingorder";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: customTitleText("Upcoming", colors: Colors.white)),
          Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                height: getProportionateScreenHeight(150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTitleText("Restaurant Name", size: 14),
                          customDescriptionText("#1DF90E")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: getProportionateScreenHeight(8),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customDescriptionText("Estimated Arrival"),
                              customTitleText("25min",
                                  colors: Colors.black, size: 15)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 64.0),
                            child: Container(
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(90),
                              decoration: BoxDecoration(
                                  color: Color(0xFF503E9D).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: customDescriptionText("Track Order",
                                    fontSize: 10, colors: UIData.kbrightColor),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
          DraggableScrollableSheet(
              expand: true,
              maxChildSize: 0.7,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (BuildContext context, ScrollController controllers) {
                return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 16, right: 16),
                        child: ListView(
                            controller: controllers,
                            scrollDirection: Axis.vertical,
                            children: [
                              customTitleText("Past Orders",
                                  size: 18, colors: Colors.black),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Obx(()
                                 {
                                  return Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      controller: controllers,
                                      itemCount: controller.previousOrderList.length,
                                      itemBuilder: (BuildContext context, index) =>
                                          Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: UpComingOrderWidget(
                                          ordercontroller: controllers,
                                          order: controller.previousOrderList[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ])));
              })
        ])));
  }
}

class UpComingOrderWidget extends StatelessWidget {
  const UpComingOrderWidget({Key? key, this.ordercontroller,this.order}) : super(key: key);

  final ScrollController? ordercontroller;
  final Order? order;

  buildContainer(String name, String multiple) {
    return Container(
      height: getProportionateScreenHeight(40),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 30,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: customDescriptionText(multiple),
                    )),
              ),
            )),
        Expanded(
            flex: 6,
            child: Container(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: customTitleText(name, size: 14),
            ))),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(250),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTitleText(order!.restaurant!.restaurantName!, size: 14),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                customDescriptionText("March 06, 2021 ",
                                    fontSize: 12),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Container(
                                  height: 4,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(15),
                                ),
                                customDescriptionText("23:54", fontSize: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: getProportionateScreenHeight(20),
                        width: getProportionateScreenWidth(80),
                        decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: customDescriptionText("${order!.status}",
                                fontSize: 10, colors: Color(0xFFFACD5D))),
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    controller: ordercontroller,
                    shrinkWrap: true,
                    itemCount: order!.foodMenu!.length,
                   itemBuilder: (_,index){
                     FoodMenu item=order!.foodMenu![index];
                     return
                     buildContainer(item.menuName!, "1");}
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        customTitleText("1 more items",
                            size: 12, colors: Color(0xFF1A6164)),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 13,
                          color: UIData.kbrightColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                              height: getProportionateScreenHeight(30),
                              //width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                color: UIData.kbrightColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: customDescriptionText("Details",
                                    colors: Colors.white, fontSize: 10),
                              )),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                              height: getProportionateScreenHeight(30),
                              // width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                color: UIData.kbrightColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: customDescriptionText("Get Help",
                                    fontSize: 10, colors: UIData.kbrightColor),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
