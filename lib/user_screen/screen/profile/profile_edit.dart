import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key}) : super(key: key);

  static const routeName = "/.edit_profile";

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  buildTextFormField(
      IconData icon,
      // String image,
      Color color,
      String label,
      String initialvalue) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 50,
            decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: color,
            ),
            // child: Image.asset(
            //   image,
            //   height: 20,
            //   width: 20,
            //   color: UIData.kbrightColor,
            //   fit: BoxFit.fill,
            // ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: TextFormField(
                initialValue: initialvalue,

                // textCapitalization: textCapitalization,
                cursorColor: UIData.kbrightColor,
                onTap: () {},
                autofocus: false,
                // controller: controller,

                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                //readOnly: ,
                keyboardType: TextInputType.streetAddress,
                minLines: 1,

                decoration: InputDecoration(
                  // prefixIcon: prefixIcon,
                  contentPadding: EdgeInsets.symmetric(vertical: 2),

                  labelText: label,
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),

                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xFFA3A3A4),
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE7EFEF),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  counter: Offstage(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Image.asset("assets/images/dough.png"),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  customTitleText("Dara Obafemi",
                      size: 16, colors: Colors.white)
                ],
              )),
          DraggableScrollableSheet(
              maxChildSize: 1.0,
              initialChildSize: 0.65,
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
                              Container(
                                // Adding height to the container will make it scrollable inside
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customDescriptionText("Profile Details"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      buildTextFormField(
                                          Icons.person_outline,
                                          UIData.kbrightColor,
                                          "FULL NAME",
                                          "Dara Obafemi"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      buildTextFormField(
                                          Icons.email_outlined,
                                          UIData.kbrightColor,
                                          "EMAIL ADDRESS",
                                          "daraobafemi@gmail.com"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      buildTextFormField(
                                          Icons.call,
                                          Colors.amber,
                                          "PHONE NUMBER",
                                          "07003324768"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      customDescriptionText("Saved Places"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      buildTextFormField(
                                          Icons.home_outlined,
                                          UIData.kbrightColor,
                                          "HOME",
                                          "775 Cletus Estates Suite 423"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      buildTextFormField(
                                          Icons.work_outline,
                                          UIData.kbrightColor,
                                          "WORK",
                                          "Add work address"),
                                    ],
                                  ),
                                ),
                              )
                            ])));
              })
        ])));
  }
}
