import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';

class CustomPasswordTextfield extends StatelessWidget {
  final String label;
//  final EntryField entryField;

  final TextEditingController controller;
  final String image;

  final bool isShow;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  // final ValueChanged<String> validate;

  // final Function onSaved;

  const CustomPasswordTextfield({
    //required this.entryField,
    required this.label,
    required this.controller,
    required this.image,

    //required this.initialValue,
    required this.focusNode,
    required this.keyboardType,
    //required this.maxLength,

    required this.isShow,
    // required this.validate,

    //required this.maxLines,
    required this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
                color: UIData.kbrightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Image.asset(
              image,
              height: 20,
              width: 20,
              color: UIData.kbrightColor,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: TextFormField(
                // textCapitalization: textCapitalization,
                cursorColor: UIData.kbrightColor,
                onTap: () {},
                autofocus: false,
                controller: controller,
                // initialValue: initialValue,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                //readOnly: ,
                keyboardType: keyboardType,
                minLines: 1,
                obscureText: isShow,

                decoration: InputDecoration(
                  // prefixIcon: prefixIcon,

                  suffixIcon: suffixIcon,
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.black54),

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: UIData.klightColor,
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
}

class CustomTextField extends StatelessWidget {
  final String label;

//  final EntryField entryField;

  final TextEditingController controller;
  final String image;
  // VoidCallback? voidCallback;

  final TextInputType keyboardType;

  final String hint;
  final FocusNode focusNode;

  const CustomTextField(
    this.label,
    this.controller,
    this.image,
    this.focusNode,
    this.keyboardType,
    this.hint,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
                color: UIData.kbrightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Image.asset(
              image,
              height: 20,
              width: 20,
              color: UIData.kbrightColor,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: TextFormField(
                // textCapitalization: textCapitalization,
                cursorColor: UIData.kbrightColor,
                onTap: () {},
                onSaved: (_) {},
                autofocus: false,
                controller: controller,
                // initialValue: initialValue,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                //readOnly: ,
                keyboardType: keyboardType,
                minLines: 1,

                decoration: InputDecoration(
                  // prefixIcon: prefixIcon,

                  labelText: label,
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: hint,

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
}
