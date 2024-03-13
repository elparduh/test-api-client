import 'package:http_client/api_config/api_config.dart';
import 'package:http_client/api_config/http_method.dart';
import 'package:http_client/api_config/path.dart';

class Endpoint {
  final Path path;
  final HttpMethod httpMethod;
  final Map<String, String> queryParameters;
  final Map<String, String> additionalHeaders;
  final dynamic body;

  Endpoint(
      {required this.path,
      required this.httpMethod,
      this.queryParameters = const {},
      this.additionalHeaders = const {},
      this.body});
}

extension EndpointExt on Endpoint {
  Uri getUrlRequest() {
    Uri url = Uri.parse(path.fullPath);

    if (queryParameters.isNotEmpty) {
      url = url.replace(
        queryParameters: queryParameters,
      );
    }

    return url;
  }

  Map<String, String> getAllHeaders() {
    Map<String, String> headers;

    headers = {
      ApiConfig.contentType: ApiConfig.applicationJson,
      ...additionalHeaders,
    };

    return headers;
  }
}
