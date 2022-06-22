import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';
import 'package:ifes_solar/repositories/user_repository.dart';

import '../controllers/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepository(api: solarApi);
    final userRepository = UserRepository(api: solarApi);
    Get.lazyPut<AuthController>(
        () => AuthController(authRepository: authRepository));
    Get.lazyPut<UserController>(
        () => UserController(userRepository: userRepository));
  }
}
