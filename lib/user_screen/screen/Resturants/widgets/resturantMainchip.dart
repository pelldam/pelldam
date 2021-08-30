import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/widget/customWidgets.dart';

class ResturantChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData icon;
  final VoidCallback onChanged;
  const ResturantChip({
    Key? key,
    this.isSelected = false,
    this.label = 'addText',
    required this.onChanged,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: isSelected ? BorderRadius.circular(8.0) : null,
            color: isSelected ? UIData.kbrightColor : null),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : UIData.kbrightColor,
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: customTitleText(label,
                    colors: isSelected ? Colors.white : UIData.kbrightColor,
                    size: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
