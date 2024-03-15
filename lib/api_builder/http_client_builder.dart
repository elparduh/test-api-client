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
  Future request({required Endpoint endpoint}) async {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        final response = await _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
        final requestStatus = createRequestStatus(response);
        if (requestStatus.hasErrors()) {
          throw requestStatus;
        }
        return _requestHandler(response);
      default:
        final response = await _client.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
        return _requestHandler(response);
    }
  }

  dynamic _requestHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      default:
        throw HttpResponseStatus.serverError;
    }
  }

  HttpRequestStatus createRequestStatus(http.Response response) =>
      switch (response.statusCode) {
        200 => const SuccessfulRequest(),
        403 => const AccessDenied(),
        >= 500 && <= 599 => const UnavailableServer(),
        _ => Unknown(response.body)
      };
}
