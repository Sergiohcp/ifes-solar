import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/models/panel.dart';
import 'package:ifes_solar/pages/simulation/widgets/panels_list_item_widget.dart';
import 'package:ifes_solar/utils/app_bar.dart';
import 'package:ifes_solar/widgets/rounded_button_widget.dart';

class PanelsListPage extends StatefulWidget {
  const PanelsListPage({Key? key}) : super(key: key);

  @override
  State<PanelsListPage> createState() => _PanelsListPageState();
}

class _PanelsListPageState extends State<PanelsListPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();
  final PanelController panelController = Get.find<PanelController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolarColors.white,
      appBar: getInvisibleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Para começar, escolha abaixo um módulo solar de sua preferência. Lembre-se de verificar as informações detalhadas de cada um.",
                    style: SolarTextStyles.simulationQuestion,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: panelController.panels.length,
                      itemBuilder: (context, index) => Obx(
                        () => PanelsListItem(
                            panel: panelController.panels[index],
                            selectedPanel: simulationController.selectedPanel,
                            onChanged: (dynamic value) {
                              simulationController.setSelectedPanel(value);
                            },
                            onSeeDetails: (Panel value) {
                              print(value.name);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => RoundedButton(
                text: "Próximo",
                onTap: () {},
                width: MediaQuery.of(context).size.width,
                disabled: simulationController.selectedPanel.name.isEmpty,
              ),
            )
          ],
        ),
      ),
    );
  }
}
