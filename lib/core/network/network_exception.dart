import 'package:http/http.dart';

class NetworkException implements Exception {
  final String message;
  final int code;

  NetworkException({this.message = 'Ошибка сети', required this.code});

  factory NetworkException.socketException() {
    return NetworkException(message: 'Ошибка открытия соединения', code: 600);
  }

  factory NetworkException.fromResponse({required Response response, String? message}) {
    if (message == null) {
      return NetworkException(
        code: response.statusCode,
      );
    } else {
      return NetworkException(
        code: response.statusCode,
        message: message,
      );
    }
  }
}
