import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/solar_colors.dart';

void showSnackBar({String title = "", String message = ""}) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: SolarColors.white,
      backgroundColor: SolarColors.grayDark,
      borderRadius: 0,
      margin: EdgeInsets.all(0),
      animationDuration: Duration(milliseconds: 2000));
}
