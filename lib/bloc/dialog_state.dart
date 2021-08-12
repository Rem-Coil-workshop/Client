import 'package:flutter/foundation.dart';

const FIRSTNAME_KEY = 'firstname';
const LASTNAME_KEY = 'lastname';
const PASSWORD_KEY = 'password';

@immutable
abstract class FormDialogState {
  final Map<String, String> fields;
  final Map<String, String?> errorMessages;
  final bool isButtonPressed;
  final int countFields;

  const FormDialogState({
    required this.fields,
    required this.errorMessages,
    required this.isButtonPressed,
    required this.countFields,
  });

  bool get isValid =>
      isNotEmpty && errorMessages.values.every((message) => message == null);

  bool get isNotEmpty =>
      fields.length == countFields &&
      fields.values.every((fieldValue) => fieldValue.isNotEmpty);

  FormDialogState updateState(
      {required Map<String, String> fields,
      required Map<String, String?> errorMessages,
      required bool isButtonPressed});

  FormDialogState addFieldValueMessage(String fieldName, String value) {
    var fields = Map<String, String>.from(this.fields);
    fields[fieldName] = value;

    return updateState(
      fields: fields,
      errorMessages: this.errorMessages,
      isButtonPressed: this.isButtonPressed,
    );
  }

  FormDialogState addErrorMessage(String key, String? value) {
    var errorMessages = Map<String, String?>.from(this.errorMessages);
    errorMessages[key] = value;

    return updateState(
      fields: this.fields,
      errorMessages: errorMessages,
      isButtonPressed: this.isButtonPressed,
    );
  }

  FormDialogState onButtonPressed(bool isPressed) {
    return updateState(
      fields: this.fields,
      errorMessages: this.errorMessages,
      isButtonPressed: isPressed,
    );
  }
}
