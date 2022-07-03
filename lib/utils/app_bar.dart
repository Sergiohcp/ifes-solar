import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/solar_colors.dart';

PreferredSizeWidget getInvisibleAppBar() {
  return AppBar(
    backgroundColor: SolarColors.white,
    elevation: 0,
    leading: IconButton(
      highlightColor: Colors.transparent,
      icon: Icon(Icons.arrow_back_ios_new, color: SolarColors.primary),
      onPressed: () => Get.back(),
    ),
  );
}
