import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/jwt.dart';
import 'package:ifes_solar/repositories/auth_repository.dart';
import 'package:ifes_solar/utils/snack_bar.dart';
import 'package:ifes_solar/utils/user_reset.dart';

class AuthController {
  final AuthRepository authRepository;
  var _isLoginLoading = false.obs;

  AuthController({required this.authRepository});

  bool get isLoginLoading => _isLoginLoading.value;

  Future login(String email, String password) async {
    try {
      _isLoginLoading.value = true;
      var response = await this.authRepository.login(email, password);
      if (response.body != null) {
        var body = jsonDecode(response.body);
        Jwt.setJwtToken(body['jwt']);
        Get.offNamed('/User');
      }
    } catch (error) {
      showSnackBar(
          title: "Ops!", message: "Ocorreu um erro ao realizar o login.");
    } finally {
      _isLoginLoading.value = false;
    }
  }

  Future logout() async {
    userReset();
  }
}
