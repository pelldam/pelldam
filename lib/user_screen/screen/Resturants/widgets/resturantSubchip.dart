import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';

class MarketSubChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onChanged;

  const MarketSubChip({
    Key? key,
    this.isSelected = false,
    this.label = 'addText',
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onChanged,
        child: Container(
          // height: double.infinity,
          // width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: isSelected ? UIData.kbrightColor : Colors.black54),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: isSelected ? 2.0 : 0.6,
                width: double.infinity,
                color: UIData.kbrightColor.withOpacity(isSelected ? 1.0 : 0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
