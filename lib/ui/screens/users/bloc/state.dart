import 'package:flutter/foundation.dart';
import 'package:slot_service_app/core/models/user.dart';

@immutable
class UserDialogState {
  final String firstname;
  final String lastname;
  final String password;
  final RoleHolder? role;
  final Map<String, String?> errorMessages;
  final bool isReady;

  static const UserDialogState init = UserDialogState(
    firstname: '',
    lastname: '',
    password: '',
    errorMessages: {},
    role: null,
    isReady: false,
  );

  const UserDialogState({
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.errorMessages,
    required this.role,
    required this.isReady,
  });

  bool get isValid =>
      isNotEmpty &&
      errorMessages.values.every((message) => message == null) &&
      role != null;

  bool get isNotEmpty =>
      firstname.isNotEmpty && lastname.isNotEmpty && password.isNotEmpty;

  User get user => User(
        firstname: firstname,
        lastname: lastname,
        role: role!.role,
      );

  UserDialogState setFirstname(String firstname) {
    return UserDialogState(
      firstname: firstname,
      lastname: this.lastname,
      password: this.password,
      errorMessages: this.errorMessages,
      role: this.role,
      isReady: this.isReady,
    );
  }

  UserDialogState setLastname(String lastname) {
    return UserDialogState(
      firstname: this.firstname,
      lastname: lastname,
      password: this.password,
      errorMessages: this.errorMessages,
      role: this.role,
      isReady: this.isReady,
    );
  }

  UserDialogState setPassword(String password) {
    return UserDialogState(
      firstname: this.firstname,
      lastname: this.lastname,
      password: password,
      errorMessages: this.errorMessages,
      role: this.role,
      isReady: this.isReady,
    );
  }

  UserDialogState addErrorMessage(String key, String? value) {
    var errorMessages = Map<String, String?>.from(this.errorMessages);
    errorMessages[key] = value;

    return UserDialogState(
      firstname: this.firstname,
      lastname: this.lastname,
      password: password,
      errorMessages: errorMessages,
      role: this.role,
      isReady: this.isReady,
    );
  }

  UserDialogState changeRole(RoleHolder? role) {
    return UserDialogState(
      firstname: this.firstname,
      lastname: this.lastname,
      password: this.password,
      errorMessages: this.errorMessages,
      role: role,
      isReady: this.isReady,
    );
  }

  UserDialogState changeReady(bool isReady) {
    return UserDialogState(
      firstname: this.firstname,
      lastname: this.lastname,
      password: this.password,
      errorMessages: this.errorMessages,
      role: this.role,
      isReady: isReady,
    );
  }
}
