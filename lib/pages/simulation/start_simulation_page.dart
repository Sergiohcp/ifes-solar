import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/utils/app_bar.dart';
import 'package:ifes_solar/widgets/rounded_button_widget.dart';

class StartSimulationPage extends StatelessWidget {
  const StartSimulationPage({Key? key}) : super(key: key);

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
            Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Energia solar fotovoltaica nada mais é do que a conversão direta da radiação solar em energia elétrica. Essa conversão é realizada pelas chamadas células fotovoltaicas, compostas por material semicondutor, normalmente o silício. Ao incidir sobre as células, a luz solar provoca a movimentação dos elétrons do material condutor, transportando-os pelo material até serem captados por um campo elétrico (formado por uma diferença de potencial existente entre os semicondutores). Dessa forma, gera-se eletricidade.",
                  style: SolarTextStyles.simulationDescription,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Que tal realizarmos uma simulação de geração de energia na região de sua escolha?",
                  style: SolarTextStyles.simulationQuestion,
                )
              ],
            ),
            RoundedButton(
              text: "Iniciar simulação",
              onTap: () {
                Get.toNamed('/PanelsList');
              },
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
