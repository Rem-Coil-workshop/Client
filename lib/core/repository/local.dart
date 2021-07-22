import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class LocalRepository extends BaseRepository {
  Future<bool> get isEntered async {
    final prefs = await SharedPreferences.getInstance();
    final _isEntered = prefs.getBool('isEntered') ?? true;
    return _isEntered;
  }
}