import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/core/utils/converters.dart';

class TokenLocalRepository extends BaseRepository {
  static const TOKEN_KEY = 'token';

  Future<bool> get isEntered async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TOKEN_KEY);
    if (token == null) return false;
    return !Jwt.isExpired(token);
  }

  Future<User?> get currentUser async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TOKEN_KEY);
    if (token == null) return null;
    final payload = Jwt.parseJwt(token);

    return User(
      firstname: payload['firstname'],
      lastname: payload['lastname'],
      role: toUserRole(payload['role']),
    );
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, token);
  }
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(TOKEN_KEY);
  }
}
