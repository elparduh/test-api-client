import 'dart:convert';
import 'dart:io';

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
  @override
  Future request({required Endpoint endpoint}) async {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        final response = await http.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
        final requestStatus = _createRequestStatus(response);
        if (requestStatus.hasErrors()) {
          throw requestStatus;
        }
        final responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        final response = await http.get(endpoint.getUrlRequest(),
            headers: endpoint.getAllHeaders());
            //final jsonBody = body != null ? jsonEncode(body) : null;POST
            
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
