import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/models/user.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:get/get.dart';

// class CreateProfileScreen extends StatefulWidget {
class CreateProfileScreen extends GetView<AuthServices> {
  // CreateProfileScreen({Key? key}) : super(key: key);
  static const routeName = "/.createProfile";
  final getController = Get.put(AuthServices());
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // _fullname = _firstnamecontroller.text + " " + _lastnamecontroller.text;
    // controller.signInFullnameController.text = _fullname;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: backArrow(() {
            Navigator.of(context).pop();
          }, colorIcon: Colors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Stack(children: [
            Container(
              color: UIData.kbrightColor,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Positioned(
                top: 130,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    customTitleText(
                      "Create your profile",
                      colors: Colors.black,
                    ),
                  ],
                )),

            // Positioned(child: child),
            DraggableScrollableSheet(
                maxChildSize: 0.9,
                initialChildSize: 0.7,
                minChildSize: 0.7,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(children: [
                            SizedBox(
                              height: getProportionateScreenHeight(80),
                            ),
                            Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[500]!.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16, top: 8),
                                      child: Text(
                                        "First",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: "SofiaPro",
                                        ),
                                      ),
                                    )),
                                  ),
                                  VerticalDivider(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 16, top: 10),
                                      child: TextFormField(
                                        // textCapitalization: textCapitalization,
                                        cursorColor: UIData.kbrightColor,
                                        onTap: () {},
                                        autofocus: false,
                                        controller: getController
                                            .signupfirstnameController,
                                        // initialValue: initialValue,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                        //readOnly: ,
                                        keyboardType: TextInputType.name,
                                        minLines: 1,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          // prefixIcon: prefixIcon,

                                          counter: Offstage(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[500]!.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16, top: 8),
                                      child: Text(
                                        "Last",
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontFamily: "SofiaPro",
                                        ),
                                      ),
                                    )),
                                  ),
                                  VerticalDivider(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 16, top: 10),
                                      child: TextFormField(
                                        // textCapitalization: textCapitalization,
                                        cursorColor: UIData.kbrightColor,
                                        onTap: () {},
                                        autofocus: false,
                                        controller: getController
                                            .signuplastnameController,
                                        // validator: (value) => ,

                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                        //readOnly: ,
                                        keyboardType: TextInputType.name,
                                        minLines: 1,

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counter: Offstage(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(40),
                            ),
                            GestureDetector(
                              onTap: () {
                                 getController.concertenate();
                                // print(
                                //   Get.arguments['username'],
                                // );
                                // print(
                                //   Get.arguments['email'],
                                // );
                                // print(
                                //   Get.arguments['password'],
                                // );
                                // print(
                                //   Get.arguments['phoneNumber'],
                                // );
                                // print(getController.fullnameController);

                                if (getController.status != Status.Loading) {
                                  // UserModel user = UserModel(
                                  //   fullName:
                                  //       getController.fullnameController.text,
                                   
                                  // );
                                   getController.register();
                                  // getController.register(
                                  //   user,
                                  // );
                                }
                                //Navigator.of(context).pushNamed(DeliveryScreen.routeName);
                              },
                              child: Container(
                                  height: 60,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: UIData.kbrightColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: double.infinity * 0.6,
                                  child: Center(
                                    child: Container(
                                      child: Obx(()
                                     {
                                          return (getController.status==Status.Loading)?
                                          Container(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(color: Colors.white,),
                                          )
                                          :Text(
                                            "Done",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                      ),
                              ),
                                  ))),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Center(
                              child: customDescriptionText(
                                  "By signing up you agree to our Terms\n of Use and Privacy Policy",
                                  textAlign: TextAlign.center),
                            ),
                          ])
                        ]),
                  );
                }),

            // Positioned(
            //     top: 180,
            //     left: 50,
            //     right: 50,
            //     child: Align(
            //         alignment: Alignment.center, child: ProfileImagePicker()))
          ]),
        )));
  }
}
