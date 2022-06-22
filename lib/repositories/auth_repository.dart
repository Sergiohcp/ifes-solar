import 'package:ifes_solar/core/solar_api.dart';

class AuthRepository {
  final SolarApi api;

  AuthRepository({required this.api});

  Future login(String email, String password) {
    return this
        .api
        .post('/api/auth/local', {'identifier': email, 'password': password});
  }
}
