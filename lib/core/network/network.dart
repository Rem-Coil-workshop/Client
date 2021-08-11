import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/network/config.dart';

class NetworkConfigRepository {
  static const HOST_KEY = 'host';
  static const PORT_KEY = 'port';

  static Future<NetworkConfig> loadConfig() async {
    final preferences = await SharedPreferences.getInstance();
    final host = preferences.getString(HOST_KEY);
    final port = preferences.getInt(PORT_KEY);

    if (host == null ||  port == null) {
      return NetworkConfig.defaultConfig();
    } else {
      return NetworkConfig(host: host, port: port);
    }
  }

  static Future<void> updateConfig(String host, int port) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(HOST_KEY, host);
    preferences.setInt(PORT_KEY, port);
  }
}