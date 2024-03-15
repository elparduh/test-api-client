// ignore_for_file: overridden_fields

import 'package:http_client/api_config/localizable.dart';

enum HttpResponseStatus {
  success,
  accessDenied,
  serverError,
  unavailableServer,
  connectionNetwork,
  unknown
}

sealed class HttpRequestStatus {
  const HttpRequestStatus(this.message);
  final String message;
}

class SuccessfulRequest extends HttpRequestStatus {
  const SuccessfulRequest() : super(Localizable.successfulRequestTextError);
}

class AccessDenied extends HttpRequestStatus {
  const AccessDenied() : super(Localizable.accessDeniedTextError);
}

class UnavailableServer extends HttpRequestStatus {
  const UnavailableServer() : super(Localizable.unavailableServerTextError);
}

class ConnectionNetwork extends HttpRequestStatus {
  const ConnectionNetwork() : super(Localizable.connectionNetworkTextError);
}

class Unknown extends HttpRequestStatus {
  const Unknown(this.errorMessage) : super(errorMessage);
  final String errorMessage;
}

extension HttpRequestStatusX on HttpRequestStatus {
  hasErrors() => this is! SuccessfulRequest;
}

sealed class ErrorState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessfulErrorStateRequest extends ErrorState {
  @override
  final String errorMessage;
  SuccessfulErrorStateRequest(this.errorMessage) : super(errorMessage);
}
