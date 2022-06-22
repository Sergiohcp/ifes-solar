import 'dart:convert';

import 'package:get/get.dart';
import 'package:ifes_solar/models/user.dart';
import 'package:ifes_solar/repositories/user_repository.dart';
import 'package:ifes_solar/utils/snack_bar.dart';
import 'package:ifes_solar/utils/user_reset.dart';

class UserController {
  final UserRepository userRepository;
  final _user = User().obs;
  var _isUserLoading = false.obs;

  UserController({required this.userRepository});

  bool get isUserLoading => _isUserLoading.value;
  User get user => _user.value;

  Future getUser() async {
    try {
      _isUserLoading.value = true;
      var response = await this.userRepository.getUser();
      if (response.statusCode != 200) {
        userReset();
        showSnackBar(
            title: "Ops!",
            message:
                "Ocorreu um erro ao realizar a busca de suas informações.");
        return;
      }
      if (response.body != null) {
        var body = jsonDecode(response.body);
        final User userInstance = User.fromJson(body);
        _user.value = userInstance;
      }
    } finally {
      _isUserLoading.value = false;
    }
  }
}
