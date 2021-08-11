import 'package:slot_service_app/core/network/config.dart';

class UriBuilder {
  final String _host;

  UriBuilder(NetworkConfig config)
      : _host = config.host + ':' + config.port.toString();

  Uri withoutParams(String path) => Uri.http(_host, path);
}
