import 'package:ifes_solar/core/solar_api.dart';

class AuthRepository {
  final SolarApi api;

  AuthRepository({required this.api});

  Future register(String username, String email, String password) {
    return this.api.post('/api/login/local/register',
        {'username': username, 'email': email, 'password': password});
  }

  Future login(String email, String password) {
    return this
        .api
        .post('/api/login/local', {'identifier': email, 'password': password});
  }
}
