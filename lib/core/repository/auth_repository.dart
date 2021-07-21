import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  final _users = [
    User(firstname: 'Илья', lastname: 'Родионов', role: UserRole.ADMIN),
    User(firstname: 'Дмитрий', lastname: 'Жарков', role: UserRole.EMPLOYEE),
  ];

  Future<List<User>> get users async => _users;
}