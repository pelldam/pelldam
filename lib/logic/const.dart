import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIData {
  // routes
  static const klightColor = Color(0xFFE7EFEF);
  static const kdarkColor = Color(0xFF1B6164);
  static const kbrightColor = Color(0xFFFF574D);
  static const kbackgroundwhite = Color(0xFFF7F7F7);
  static const kstarIcon = Color(0xFFFACD5D);
  static const kblack = Color(0xFF2D2D2D);

  static showErrorSnackBar(String e) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: UIData.kbrightColor,
      borderRadius: 5,
      messageText: Text(
        e,
        maxLines: 30,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
      barBlur: 20,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.zero,
    );
  }
}
