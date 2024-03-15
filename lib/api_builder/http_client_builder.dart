import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_client/api_config/http_response_status.dart';
import '../api_config/endpoint.dart';

abstract class HttpClient {
  Future<dynamic> get({
    required Endpoint endpoint,
  });
}

class HttpClientBuilder implements HttpClient {
  @override
  Future get({required Endpoint endpoint}) async {
    final response = await http.get(endpoint.getUrlRequest(),
        headers: endpoint.getAllHeaders());
    final requestStatus = _createRequestStatus(response);
    if (requestStatus.hasErrors()) {
      throw requestStatus;
    }
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }

  HttpRequestStatus _createRequestStatus(http.Response response) =>
      switch (response.statusCode) {
        200 => const SuccessfulRequest(),
        403 => const AccessDenied(),
        >= 500 && <= 599 => const UnavailableServer(),
        _ => Unknown(response.body)
      };

  HttpRequestStatus createRequestStatusFrom(Exception exception) =>
      switch (exception) {
        SocketException() => const ConnectionNetwork(),
        _ => Unknown(exception.toString())
      };
}
