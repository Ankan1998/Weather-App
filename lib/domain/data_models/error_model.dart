class ErrorModel {
  final ErrorType error;
  final String message;

  ErrorModel({required this.error, required this.message});
}

enum ErrorType { internetDisconnected, dioError, generalError }
