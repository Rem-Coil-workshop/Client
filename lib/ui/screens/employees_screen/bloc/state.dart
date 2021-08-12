import 'package:flutter/foundation.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/models/employee.dart';

const COUNT_FIELDS = 2;

@immutable
class EmployeeDialogState extends FormDialogState {
  final String? cardValue;

  static const EmployeeDialogState init = EmployeeDialogState(
    fields: {},
    errorMessages: {},
    isButtonPressed: false,
    cardValue: null,
  );

  const EmployeeDialogState({
    required Map<String, String> fields,
    required Map<String, String?> errorMessages,
    required bool isButtonPressed,
    required this.cardValue,
  }) : super(
          fields: fields,
          errorMessages: errorMessages,
          isButtonPressed: isButtonPressed,
          countFields: COUNT_FIELDS,
        );

  @override
  bool get isValid => super.isValid && cardValue != null;

  String? get firstname => fields[FIRSTNAME_KEY];

  String? get lastname => fields[LASTNAME_KEY];

  Employee get employee {
    return Employee(
      firstname: firstname!,
      lastname: lastname!,
      number: int.parse(cardValue!),
    );
  }

  @override
  FormDialogState updateState({
    required Map<String, String> fields,
    required Map<String, String?> errorMessages,
    required bool isButtonPressed,
  }) {
    return EmployeeDialogState(
      fields: fields,
      errorMessages: errorMessages,
      cardValue: this.cardValue,
      isButtonPressed: isButtonPressed,
    );
  }

  EmployeeDialogState changeCard(String? cardValue) {
    return EmployeeDialogState(
      fields: this.fields,
      errorMessages: this.errorMessages,
      cardValue: cardValue,
      isButtonPressed: this.isButtonPressed,
    );
  }
}
