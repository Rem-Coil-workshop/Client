import 'package:slot_service_app/core/network/config.dart';

class UriBuilder {
  static Uri withoutParams(String path) {
    final host = HOST + ':' + PORT.toString();
    return Uri.http(host, path);
  }
}