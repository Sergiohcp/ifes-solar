import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/controllers/panel_controller.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';
import 'package:ifes_solar/repositories/panel_repository.dart';
import 'package:ifes_solar/repositories/user_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepository(api: solarApi);
    final userRepository = UserRepository(api: solarApi);
    final panelRepository = PanelRepository(api: solarApi);
    Get.lazyPut<AuthController>(
        () => AuthController(authRepository: authRepository));
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
    Get.lazyPut<PanelController>(
        () => PanelController(panelRepository: panelRepository));
  }
}
