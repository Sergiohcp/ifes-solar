import 'package:ifes_solar/core/solar_api.dart';
import 'package:ifes_solar/models/jwt.dart';

class UserRepository {
  final SolarApi api;

  UserRepository({required this.api});

  Future getUser() async {
    final jwt = await Jwt.getJwtToken();
    return await this
        .api
        .get('/api/users/me', {'Authorization': 'Bearer $jwt'});
  }
}
