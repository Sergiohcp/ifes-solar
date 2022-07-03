import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/utils/app_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    return Scaffold(
      backgroundColor: SolarColors.white,
      appBar: getInvisibleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nome: ",
                  style: SolarTextStyles.userInfoTitle,
                ),
                Text(
                  userController.user.name,
                  style: SolarTextStyles.userInfoDescription,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email: ",
                  style: SolarTextStyles.userInfoTitle,
                ),
                Text(
                  userController.user.email,
                  style: SolarTextStyles.userInfoDescription,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
