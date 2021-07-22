
import 'package:slot_service_app/core/models/user.dart';

UserRole toUserRole(String role) {
  switch(role.toUpperCase()) {
    case 'ADMIN':
      return UserRole.ADMIN;
    default:
      return UserRole.EMPLOYEE;
  }
}