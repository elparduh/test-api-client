import 'package:http/http.dart' as http;
import 'package:http_client/api_config/http_method.dart';
import 'package:http_client/api_config/path.dart';

import '../api_config/endpoint.dart';

class HttpClientBuilder {
  final http.Client _client;

  HttpClientBuilder(this._client);

  Future<dynamic> request({required Endpoint endpoint}) {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        return _client.get(Uri.parse(endpoint.path.fullPath),
            headers: endpoint.getAllHeaders());
      case HttpMethod.post:
        return _client.get(Uri.parse(endpoint.path.fullPath),
            headers: endpoint.getAllHeaders());
      case HttpMethod.put:
        return _client.get(Uri.parse(endpoint.path.fullPath),
            headers: endpoint.getAllHeaders());
      case HttpMethod.patch:
        return _client.get(Uri.parse(endpoint.path.fullPath),
            headers: endpoint.getAllHeaders());
      case HttpMethod.delete:
        return _client.get(Uri.parse(endpoint.path.fullPath),
            headers: endpoint.getAllHeaders());
    }
  }
}
