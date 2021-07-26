import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/utils/converters.dart';

class JsonUser {
  final String firstname;
  final String lastname;
  final String role;

  JsonUser({
    required this.firstname,
    required this.lastname,
    required this.role,
  });

  factory JsonUser.fromUser(User user) {
    return JsonUser(
      firstname: user.firstname,
      lastname: user.lastname,
      role: user.role.toServerRole(),
    );
  }

  factory JsonUser.fromJson(Map<String, dynamic> json) {
    return JsonUser(
      firstname: json['firstname'],
      lastname: json['lastname'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'role': role,
    };
  }

  Map<String, dynamic> toJsonWithPassword(String password) {
    final json = this.toJson();
    json['password'] = password;
    return json;
  }

  User toUser() {
    return User(
      firstname: firstname,
      lastname: lastname,
      role: toUserRole(role),
    );
  }
}
