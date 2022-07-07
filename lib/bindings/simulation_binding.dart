import 'package:get/get.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/repositories/panel_repository.dart';
import 'package:ifes_solar/repositories/simulation_repository.dart';

class SimulationBinding implements Bindings {
  @override
  void dependencies() {
    final simulationRepository = SimulationRepository(api: solarApi);
    final panelRepository = PanelRepository(api: solarApi);
    Get.lazyPut<SimulationController>(
        () => SimulationController(simulationRepository: simulationRepository));
    Get.lazyPut<PanelController>(
        () => PanelController(panelRepository: panelRepository));
  }
}
