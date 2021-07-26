import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String firstname,
    required String lastname,
    required UserRole role,
  }) = _User;

  @override
  String toString() {
    return '$firstname $lastname';
  }
}

enum UserRole { ADMIN, EMPLOYEE }

class RoleHolder {
  final UserRole role;

  RoleHolder(this.role);

  @override
  String toString() {
    switch (role) {
      case UserRole.ADMIN:
        return 'Администратор';
      case UserRole.EMPLOYEE:
        return 'Обычный пользователь';
    }
  }
}

const ADMIN_PRIVACY_LEVEL = 0;
const EMPLOYEE_PRIVACY_LEVEL = 1;
