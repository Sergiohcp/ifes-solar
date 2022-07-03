import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();
  final PanelController panelController = Get.find<PanelController>();

  void getUser() async {
    await userController.getUser();
  }

  void getPanels() async {
    await panelController.getPanels();
  }

  @override
  void initState() {
    getUser();
    getPanels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      {
        'title': 'Simulação',
        'onTap': () {
          Get.toNamed('/StartSimulation');
        },
        'color': SolarColors.primary,
      },
      {
        'title': 'Meus dados',
        'onTap': () {
          Get.toNamed('/User');
        },
        'color': SolarColors.semiBlack,
      },
      {
        'title': 'Minhas simulações',
        'onTap': () {
          Get.toNamed('/UserSimulations');
        },
        'color': SolarColors.semiBlack,
      },
    ];

    return Scaffold(
      backgroundColor: SolarColors.white,
      appBar: AppBar(
        title: Obx(
          () => Text(
            userController.user.name.isEmpty
                ? 'Olá!'
                : 'Olá, ${userController.user.name}!',
            style: SolarTextStyles.titleWhite,
          ),
        ),
        backgroundColor: SolarColors.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.logout();
            },
          )
        ],
      ),
      body: Obx(
          () => userController.isUserLoading || panelController.isPanelsLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: SolarColors.primary,
                ))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: SolarColors.grayDarker,
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: list[index]['onTap'] as void Function()?,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${list[index]['title']}',
                                style: TextStyle(
                                    color: list[index]['color'] as Color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Icon(Icons.arrow_forward_ios_outlined,
                                size: 20, color: list[index]['color'] as Color)
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
