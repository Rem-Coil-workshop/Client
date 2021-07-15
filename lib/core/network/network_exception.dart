class NetworkException implements Exception {
  final String message;
  final int code;

  NetworkException({this.message = 'Ошибка сети', required this.code});

  factory NetworkException.socketException() {
    return NetworkException(message: 'Ошибка открытия соединения',code: 600);
  }
}