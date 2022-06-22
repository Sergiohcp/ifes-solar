import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/bindings/auth_binding.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/pages/auth/auth_page.dart';
import 'package:ifes_solar/pages/splash/splash_page.dart';

class SolarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ifes Solar',
      theme: ThemeData(
          primaryColor: SolarColors.primary, brightness: Brightness.light),
      navigatorKey: Get.key,
      initialRoute: '/Splash',
      getPages: [
        GetPage(name: '/Splash', page: () => SplashPage()),
        GetPage(name: '/Auth', page: () => AuthPage(), binding: AuthBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
