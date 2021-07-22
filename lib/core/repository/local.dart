import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class LocalRepository extends BaseRepository {
  late SharedPreferences prefs;

  Future<void> _updatePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> get isEntered async {
    await _updatePrefs();
    final token = prefs.getBool('token');
    // TODO - Добавить проверку активности пользователя
    return false;
  }

  Future<User> get currentUser async {
    await _updatePrefs();
    final token = prefs.getString('token');

    // TODO - Добавить парсинг токена

    return User(firstname: '', lastname: '', role: UserRole.ADMIN);
  }

  Future<void> logout() async {
    // TODO - Удалить токен
  }
}
