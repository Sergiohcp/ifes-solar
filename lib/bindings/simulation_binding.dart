import 'package:get/get.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/repositories/user_repository.dart';

import '../controllers/user_controller.dart';

class SimulationBinding implements Bindings {
  @override
  void dependencies() {
    final userRepository = UserRepository(api: solarApi);
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
    Get.lazyPut<SimulationController>(() => SimulationController());
  }
}
