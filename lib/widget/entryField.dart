import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String image;
  final String initialValue;
  final bool readOnly;
  final bool isShow;
  final TextInputType keyboardType;
  final int maxLength;
  final int maxLines;
  final String hint;
  final EdgeInsetsGeometry contentPadding;
  final InputBorder border;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function onTap;
  final Function validator;
  final Function autocorrect;
  final Function onSaved;
  final TextCapitalization textCapitalization;

  EntryField({
    required this.controller,
    required this.label,
    required this.image,
    required this.initialValue,
    required this.readOnly,
    required this.keyboardType,
    required this.maxLength,
    required this.hint,
    required this.isShow,
    required this.contentPadding,
    required this.border,
    required this.maxLines,
    required this.suffixIcon,
    required this.onTap,
    required this.textCapitalization,
    required this.prefixIcon,
    required this.validator,
    required this.autocorrect,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: TextFormField(
        textCapitalization: textCapitalization,
        cursorColor: Colors.black,
        onTap: () => onTap,
        autofocus: false,
        controller: controller,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.body2!.copyWith(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        readOnly: readOnly,
        keyboardType: keyboardType,
        minLines: 1,
        maxLength: maxLength,
        onSaved: (value) => onSaved,
        //validator: ,
        autocorrect: false,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: (isShow)
              ? Icon(Icons.remove_red_eye_rounded,
                  size: 20, color: Colors.black12)
              : null,
          labelText: label,
          hintText: hint,
          contentPadding: contentPadding,
          border: border,
          counter: Offstage(),
          icon: (image != null)
              ? ImageIcon(
                  AssetImage(image),
                  color: Colors.grey,
                  size: 20.0,
                )
              : null,
        ),
      ),
    );
  }
}
