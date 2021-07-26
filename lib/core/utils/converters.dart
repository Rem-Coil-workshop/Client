
import 'package:slot_service_app/core/models/user.dart';

UserRole toUserRole(String role) {
  switch(role.toUpperCase()) {
    case 'ADMIN':
      return UserRole.ADMIN;
    default:
      return UserRole.EMPLOYEE;
  }
}

String convertRoleToString(UserRole role) {
  switch (role) {
    case UserRole.ADMIN:
      return 'Администратор';
    case UserRole.EMPLOYEE:
      return 'Обычный пользователь';
  }
}