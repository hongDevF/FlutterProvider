// ignore_for_file: prefer_typing_uninitialized_variables, annotate_overrides, camel_case_types

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([
    this._message,
    this._prefix,
  ]);

  String toString() {
    return '$_prefix$_message';
  }
}

class fetchDataException extends AppException {
  fetchDataException([String? message])
      : super(message, "Error during Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, "Unauthorised Request");
}
