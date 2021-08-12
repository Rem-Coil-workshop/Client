import 'package:flutter/foundation.dart';

@immutable
class NetworkConfig {
  // TODO - вернуть продакшн значение хоста
  // static const DEFAULT_HOST = '10.0.36.236';
  static const DEFAULT_HOST = 'localhost';
  static const DEFAULT_PORT = 80;

  final String host;
  final int port;

  const NetworkConfig({
    required this.host,
    required this.port,
  });

  factory NetworkConfig.defaultConfig() => NetworkConfig(
        host: DEFAULT_HOST,
        port: DEFAULT_PORT,
      );
}
