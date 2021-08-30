import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';

import 'package:foodie/widget/customWidgets.dart';

enum AddressActions { HOME, WORK }

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  static const routeName = "/.saved_address";

  @override
  _SavedAddressState createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  final _addresscontroller = TextEditingController();

  late AddressActions addressActions;
  @override
  void initState() {
    addressActions = AddressActions.HOME;
    super.initState();
  }

  @override
  void dispose() {
    _addresscontroller.dispose();

    super.dispose();
  }

  buildTextFormField(
      Widget widget,
      /* TextEditingController controller */
      String label,
      Color color,
      String initialvalue) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 35,
            height: 50,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: widget,
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
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                //readOnly: ,
                keyboardType: TextInputType.streetAddress,
                minLines: 1,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 8),
                  // prefixIcon: prefixIcon,

                  labelText: label,
                  labelStyle: TextStyle(color: Colors.black54),

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

  void changeAddress(AddressActions actions) {
    setState(() {
      addressActions = actions;
    });
  }

  Widget _buildAddress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AddressChip(
            label: "Home",
            isSelected: addressActions == AddressActions.HOME,
            onChanged: () => changeAddress(AddressActions.HOME)),
        AddressChip(
            label: "Work",
            isSelected: addressActions == AddressActions.WORK,
            onChanged: () => changeAddress(AddressActions.WORK)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIData.kbrightColor,
      body: SafeArea(
        child: Stack(
          children: [
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
              child: customTitleText("Saved Address", colors: Colors.white),
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: _buildAddress()),
            ),
            DraggableScrollableSheet(
                maxChildSize: 0.8,
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
                          child: DisplayWidget(
                            displayWidget:
                                addressActions == AddressActions.HOME,
                            child: ListView(
                                controller: controller,
                                scrollDirection: Axis.vertical,
                                children: [
                                  // can return a dissmissabel widget which also works well with a ListView.builder
                                  buildTextFormField(
                                      Image.asset(
                                        "assets/icons/ic_home.png",
                                        height: 20,
                                        width: 20,
                                        color: UIData.kbrightColor,
                                        fit: BoxFit.fill,
                                      ),
                                      "NAME",
                                      UIData.kbrightColor.withOpacity(0.1),
                                      "775 Cletus Estates Suite 423"),
                                ]),
                            alternateWidget: ListView(
                                controller: controller,
                                scrollDirection: Axis.vertical,
                                children: [
                                  // can return a dissmissabel widget which also works well with a ListView.builder
                                  buildTextFormField(
                                      Icon(
                                        Icons.work_outline,
                                        color: UIData.kstarIcon,
                                      ),
                                      "WORK",
                                      UIData.kstarIcon.withOpacity(0.1),
                                      "775 Cletus Estates Suite 423"),
                                ]),
                          )));
                }),
            Positioned(
              left: 10,
              right: 10,
              bottom: 15,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    height: getProportionateScreenHeight(55),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: UIData.kbrightColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Container(
                        child: Text(
                          "Add new address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayWidget extends StatelessWidget {
  final bool displayWidget;
  final Widget child;
  final Widget alternateWidget;
  const DisplayWidget({
    Key? key,
    this.displayWidget = false,
    required this.child,
    this.alternateWidget = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return displayWidget ? child : alternateWidget;
  }
}

class AddressChip extends StatelessWidget {
  const AddressChip({
    Key? key,
    this.isSelected = false,
    this.label = 'addText',
    required this.onChanged,
  }) : super(key: key);

  final bool isSelected;
  final String label;

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        height: getProportionateScreenHeight(38),
        width: getProportionateScreenWidth(134),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: customDescriptionText(label, colors: Colors.white),
        ),
      ),
    );
  }
}
