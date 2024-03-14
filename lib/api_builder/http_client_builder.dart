import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_client/api_config/http_response_status.dart';
import 'package:http_client/api_config/http_method.dart';
import '../api_config/endpoint.dart';

abstract class HttpClient {
  Future<dynamic> request({
    required Endpoint endpoint,
  });
}

class HttpClientBuilder implements HttpClient {
  final http.Client _client;

  HttpClientBuilder(this._client);

  @override
  Future request({required Endpoint endpoint}) {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        return _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
      default:
        return _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
    }
  }

  dynamic _requestHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw HttpResponseStatus.badRequest;
      case 401:
        throw HttpResponseStatus.unauthorized;
      case 403:
        throw HttpResponseStatus.forbidden;
      case 404:
        throw HttpResponseStatus.notFound;
      default:
        throw HttpResponseStatus.serverError;
    }
  }
}
