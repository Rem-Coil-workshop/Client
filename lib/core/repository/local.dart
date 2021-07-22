import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';
import 'package:slot_service_app/core/utils/converters.dart';

class LocalRepository extends BaseRepository {
  static const TOKEN_KEY = 'token';
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
    prefs.remove(TOKEN_KEY);
  }

  Future<void> saveToken(String token) async {
    prefs.setString(TOKEN_KEY, token);
  }
}
