import 'package:http_client/api_config/api_config.dart';

enum Path { dogs }

extension PathExt on Path {
  String get fullPath {
    switch (this) {
      case Path.dogs:
        const dogos = '1151549092634943488';
        return ApiConfig.baseUrl + ApiConfig.v1 + dogos;
    }
  }
}