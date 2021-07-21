import 'package:slot_service_app/redux/settings/state.dart';

class UriBuilder {
  final Network _config;

  UriBuilder(this._config);

  Uri withoutParams(String path) {
    final host = _config.host + ':' + _config.port.toString();
    return Uri.http(host, path);
  }
}
