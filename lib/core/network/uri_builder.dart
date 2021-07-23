import 'package:slot_service_app/redux/settings/state.dart';

class UriBuilder {
  final String _host;

  UriBuilder(Network config)
      : _host = config.host + ':' + config.port.toString();

  Uri withoutParams(String path) => Uri.http(_host, path);
}
