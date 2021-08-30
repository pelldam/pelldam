import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/order_respository.dart';
import 'package:foodie/user_screen/widget/orders_widget.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

class MyOrder extends StatefulWidget {
  MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final _searchcontroller = TextEditingController();
  final _orderController=Get.find<OrderRespository>();

  @override
  void dispose() {
    _searchcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]!.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        // textCapitalization: textCapitalization,
                        cursorColor: UIData.kbrightColor,
                        onTap: () {},
                        autofocus: false,
                        controller: _searchcontroller,

                        // initialValue: initialValue,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        //readOnly: ,
                        keyboardType: TextInputType.name,
                        minLines: 1,

                        decoration: InputDecoration(
                          fillColor: Colors.grey[500]!.withOpacity(0.2),
                          hintText: "Search order",
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: "Sofia Pro"),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          counter: Offstage(),
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
                        onTap: () {},
                        //   showBarModalBottomSheet(
                        //       expand: true,
                        //       context: context,
                        //       backgroundColor: Colors.transparent,
                        //       builder: (context) => FilterSearch());
                        // },
                        child: filterContainer(UIData.kbrightColor)),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 40,
              child: Row(
                children: [
                  backArrow(
                    () {},
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  customTitleText("My Orders", size: 14, colors: Colors.white)
                ],
              )),
          DraggableScrollableSheet(
              expand: true,
              maxChildSize: 0.7,
              initialChildSize: 0.7,
              minChildSize: 0.7,
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
                            top: 24.0, left: 16, right: 16),
                        child: ListView(
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  customDescriptionText("12 Feb 2021"),
                                  Obx(()
                                 {
                                      return Container(
                                        height: getProportionateScreenHeight(400),
                                        child: ListView.builder( 
                                          itemCount: _orderController.previousOrderList.length,
                                          itemBuilder: (_,index)=> 
                                       
                                            OrdersWidget(order: _orderController.previousOrderList[index],),
                                                                  
                                          
                                        ),
                                      );
                                    }
                                  ),
                                ],
                              )
                            ])));
              })
        ])));
  }
}
