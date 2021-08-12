import 'package:flutter/foundation.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/models/user.dart';

const COUNT_FIELDS = 3;

@immutable
class UserDialogState extends FormDialogState {
  final RoleHolder? role;

  static const UserDialogState init = UserDialogState(
    fields: {},
    errorMessages: {},
    isButtonPressed: false,
    role: null,
  );

  const UserDialogState({
    required Map<String, String> fields,
    required Map<String, String?> errorMessages,
    required bool isButtonPressed,
    required this.role,
  }) : super(
          fields: fields,
          errorMessages: errorMessages,
          isButtonPressed: isButtonPressed,
          countFields: COUNT_FIELDS,
        );

  @override
  bool get isValid => super.isValid && role != null;

  String? get firstname => fields[FIRSTNAME_KEY];

  String? get lastname => fields[LASTNAME_KEY];

  String? get password => fields[PASSWORD_KEY];

  User get user {
    return User(
      firstname: firstname!,
      lastname: lastname!,
      role: role!.role,
    );
  }

  @override
  FormDialogState updateState({
    required Map<String, String> fields,
    required Map<String, String?> errorMessages,
    required bool isButtonPressed,
  }) {
    return UserDialogState(
      fields: fields,
      errorMessages: errorMessages,
      isButtonPressed: isButtonPressed,
      role: this.role,
    );
  }

  UserDialogState changeRole(RoleHolder? role) {
    return UserDialogState(
      fields: this.fields,
      errorMessages: this.errorMessages,
      role: role,
      isButtonPressed: this.isButtonPressed,
    );
  }
}
