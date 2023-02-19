// ignore_for_file: prefer_typing_uninitialized_variables

class ApiResponse<T> {
  final status;
  // T data;
  final message;
  ApiResponse([this.message, this.status]);
}
