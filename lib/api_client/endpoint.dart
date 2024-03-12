import 'package:http_client/api_client/http_method.dart';
import 'package:http_client/api_client/path.dart';

class Endpoint {
  final Path path;
  final HttpMethod httpMethod;
  final Map<String, String> queryParameters;
  final Map<String, String> additionalHeaders;
  final dynamic body;
  
  Endpoint({
    required this.path,
    required this.httpMethod,
    this.queryParameters = const {},
    this.additionalHeaders = const {},
    this.body
    });
}