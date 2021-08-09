import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/core/utils/converters.dart';
import 'package:slot_service_app/redux/settings/state.dart';

class LocalRepository extends BaseRepository {
  static const TOKEN_KEY = 'token';
  static const NETWORK_HOST = 'host';
  static const NETWORK_PORT = 'port';

  late SharedPreferences prefs;

  Future<void> _updatePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> get isEntered async {
    await _updatePrefs();
    final token = prefs.getString(TOKEN_KEY);
    if (token == null) return false;
    return !Jwt.isExpired(token);
  }

  Future<User?> get currentUser async {
    await _updatePrefs();
    final token = prefs.getString(TOKEN_KEY);
    if (token == null) return null;
    final payload = Jwt.parseJwt(token);

    return User(
      firstname: payload['firstname'],
      lastname: payload['lastname'],
      role: toUserRole(payload['role']),
    );
  }

  Future<void> logout() async {
    await _updatePrefs();
    prefs.remove(TOKEN_KEY);
  }

  Future<void> saveToken(String token) async {
    await _updatePrefs();
    prefs.setString(TOKEN_KEY, token);
  }

  Future<void> saveNetworkConfig(Network config) async {
    await _updatePrefs();
    prefs.setInt(NETWORK_PORT, config.port);
    prefs.setString(NETWORK_HOST, config.host);
  }

  Future<Network> get networkConfig async {
    await _updatePrefs();
    final host = prefs.getString(NETWORK_HOST);
    final port = prefs.getInt(NETWORK_PORT);
    if (host == null ||  port == null) {
      return Network.initState;
    } else {
      return Network(host: host, port: port);
    }
  }
}
