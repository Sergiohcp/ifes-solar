import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepository(api: solarApi);
    Get.lazyPut<AuthController>(
        () => AuthController(authRepository: authRepository));
  }
}
