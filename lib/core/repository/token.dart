import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/core/utils/converters.dart';

class TokenRepository extends BaseRepository {
  static TokenRepository? _instance;
  static const TOKEN_KEY = 'token';
  String? _cachedToken;

  TokenRepository._();

  static TokenRepository instance() {
    if (_instance == null) {
      _instance = TokenRepository._();
    }
    return _instance!;
  }

  Future<bool> get isEntered async {
    if (_cachedToken == null) {
      _cachedToken = await _updateToken();
    }
    if (_cachedToken == null) return false;
    return !Jwt.isExpired(_cachedToken!);
  }

  Future<String?> get token async {
    if (_cachedToken == null) {
      _cachedToken = await _updateToken();
    }
    return _cachedToken;
  }

  Future<String?> _updateToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN_KEY);
  }

  Future<User?> get currentUser async {
    if (_cachedToken == null) return null;
    final payload = Jwt.parseJwt(_cachedToken!);

    return User(
      firstname: payload['firstname'],
      lastname: payload['lastname'],
      role: toUserRole(payload['role']),
    );
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, token);
    _cachedToken = token;
  }
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(TOKEN_KEY);
    _cachedToken = null;
  }
}
