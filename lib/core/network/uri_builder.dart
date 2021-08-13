import 'package:slot_service_app/core/network/config.dart';

class UriBuilder {
  final String _host;

  UriBuilder(NetworkConfig config)
      : _host = config.host + ':' + config.port.toString();

  Uri build(String path, Map<String, dynamic>? queryParameters) {
    if (queryParameters != null) {
      return withParams(path, queryParameters);
    } else {
      return withoutParams(path);
    }
  }

  Uri withoutParams(String path) => Uri.http(_host, path);

  Uri withParams(String path, Map<String, dynamic> queryParameters) =>
      Uri.http(_host, path, queryParameters);
}
