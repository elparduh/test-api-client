import 'package:http_client/api_config/endpoint.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<dynamic> request({
    required Endpoint endpoint,
  });
}

class HttpClientBuilder implements HttpClient {
  final http.Client client = http.Client();

  @override
  Future request({required Endpoint endpoint}) {
    throw UnimplementedError();
  }
}
