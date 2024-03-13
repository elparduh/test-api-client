import 'package:http/http.dart' as http;
import 'package:http_client/api_config/http_method.dart';
import '../api_config/endpoint.dart';

class HttpClientBuilder {
  final http.Client _client;

  HttpClientBuilder(this._client);

  Future<dynamic> request({required Endpoint endpoint}) {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        return _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
      default:
        return _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
    }
  }
}
