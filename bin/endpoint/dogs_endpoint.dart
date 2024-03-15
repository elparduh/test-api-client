import 'package:http_client/api_config/endpoint.dart';
import 'package:http_client/api_config/path.dart';

extension DogEndpoint on Endpoint {
  static Endpoint getDogs() {
    return Endpoint(path: Path.dogs);
  }
}
