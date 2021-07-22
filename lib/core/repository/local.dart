import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class LocalRepository extends BaseRepository {
  static const TOKEN_KEY = 'token';
  late SharedPreferences prefs;

  Future<void> _updatePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> get isEntered async {
    await _updatePrefs();
    final token = prefs.getString(TOKEN_KEY);
    // TODO - Добавить проверку активности пользователя
    return false;
  }

  Future<User> get currentUser async {
    await _updatePrefs();
    final token = prefs.getString(TOKEN_KEY);

    // TODO - Добавить парсинг токена

    return User(firstname: '', lastname: '', role: UserRole.ADMIN);
  }

  Future<void> logout() async {
    prefs.remove(TOKEN_KEY);
  }

  Future<void> saveToken(String token) async {
    prefs.setString(TOKEN_KEY, token);
  }
}
