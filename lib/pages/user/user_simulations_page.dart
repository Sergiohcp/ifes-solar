import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/utils/app_bar.dart';

class UserSimulationsPage extends StatelessWidget {
  const UserSimulationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    return Scaffold(
      backgroundColor: SolarColors.white,
      appBar: getInvisibleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text('Você ainda possui simulações salvas.'),
        ),
      ),
    );
  }
}
