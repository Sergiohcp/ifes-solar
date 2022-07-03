import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_images.dart';
import 'package:ifes_solar/models/jwt.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void verifyToken() async {
    final jwt = await Jwt.getJwtToken();
    Future.delayed(Duration(seconds: 3)).then((_) =>
        Get.offAllNamed(jwt != null && !jwt.isEmpty ? '/Home' : '/Login'));
  }

  @override
  void initState() {
    verifyToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: SolarColors.white),
        child: Center(
          child: Image.asset(
            SolarImages.logo,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
