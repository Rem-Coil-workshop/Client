import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/utils/converters.dart';

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

extension ServerRole on UserRole {
  String toServerRole() {
    switch (this) {
      case UserRole.ADMIN:
        return 'ADMIN';
      case UserRole.EMPLOYEE:
        return 'EMPLOYEE';
    }
  }
}

class RoleHolder {
  final UserRole role;

  RoleHolder(this.role);


  @override
  bool operator ==(Object other) {
    if (!(other is RoleHolder)) return false;

    return this.role == other.role;
  }

  @override
  String toString() => convertRoleToString(role);

  @override
  int get hashCode => super.hashCode;

}

const ADMIN_PRIVACY_LEVEL = 0;
const EMPLOYEE_PRIVACY_LEVEL = 1;
