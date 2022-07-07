import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/pages/home/widgets/home_list_item_widget.dart';

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
        'isHighlight': true,
      },
      {
        'title': 'Meus dados',
        'onTap': () {
          Get.toNamed('/User');
        },
        'isHighlight': false,
      },
      {
        'title': 'Minhas simulações',
        'onTap': () {
          Get.toNamed('/UserSimulations');
        },
        'isHighlight': false,
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
                  child: Column(
                    children: [
                      Text(
                        'Bem vindo ao Ifes Solar, a plataforma de simulação de geração de energia solar fotovoltáica do IFES. Aqui você consegue seimular o quanto teria de crédito energético utilizando energia solar.',
                        style: SolarTextStyles.homeTitle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                          itemCount: list.length,
                          itemBuilder: (context, index) => HomeListItem(
                            title: list[index]['title'] as String,
                            onTap: list[index]['onTap'] as VoidCallback,
                            isHighlight: list[index]['isHighlight'] as bool,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
