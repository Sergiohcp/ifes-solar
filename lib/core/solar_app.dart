import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/bindings/auth_binding.dart';
import 'package:ifes_solar/bindings/simulation_binding.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/pages/home/home_page.dart';
import 'package:ifes_solar/pages/login/login_page.dart';
import 'package:ifes_solar/pages/register/register_page.dart';
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
        GetPage(
            name: '/Register',
            page: () => RegisterPage(),
            binding: AuthBinding()),
        GetPage(
            name: '/Login', page: () => LoginPage(), binding: AuthBinding()),
        GetPage(
            name: '/Home',
            page: () => HomePage(),
            binding: SimulationBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
