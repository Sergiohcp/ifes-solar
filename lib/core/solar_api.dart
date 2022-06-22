import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SolarApi {
  final baseUrl = dotenv.env['BASE_URL'];
  final client = http.Client();

  Future<http.BaseResponse> get(
      String url, Map<String, String>? headers) async {
    return client.get(Uri.parse('${baseUrl}$url'), headers: headers);
  }

  Future<http.BaseResponse> post(String url, Object data) async {
    return client.post(Uri.parse('${baseUrl}$url'), body: data);
  }
}

final solarApi = SolarApi();
