import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
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
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                      itemCount: panelController.panels.length,
                      itemBuilder: (context, index) => Obx(
                        () => Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: panelController.panels[index],
                                  groupValue:
                                      simulationController.selectedPanel,
                                  onChanged: (dynamic value) {
                                    simulationController
                                        .setSelectedPanel(value);
                                  },
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    imageUrl:
                                        panelController.panels[index].image,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(
                                      strokeWidth: 1,
                                      color: SolarColors.primary,
                                    ),
                                  ),
                                ),
                                Text(panelController.panels[index].name)
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Ver',
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: SolarColors.secondary,
                                    size: 16,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
