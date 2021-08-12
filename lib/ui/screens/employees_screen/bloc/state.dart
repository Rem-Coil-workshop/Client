import 'package:flutter/foundation.dart';

@immutable
class EmployeeDialogState {
  final bool isFirstnameCorrect;
  final bool isLastnameCorrect;
  final String? cardValue;

  static const EmployeeDialogState init = EmployeeDialogState(
    isFirstnameCorrect: true,
    isLastnameCorrect: true,
    cardValue: null,
  );

  const EmployeeDialogState({
    required this.isFirstnameCorrect,
    required this.isLastnameCorrect,
    required this.cardValue,
  });

  EmployeeDialogState setFirstname(bool isFirstnameCorrect) {
    return EmployeeDialogState(
      isFirstnameCorrect: isFirstnameCorrect,
      isLastnameCorrect: this.isLastnameCorrect,
      cardValue: this.cardValue,
    );
  }

  EmployeeDialogState setLastname(bool isLastnameCorrect) {
    return EmployeeDialogState(
      isFirstnameCorrect: this.isFirstnameCorrect,
      isLastnameCorrect: isLastnameCorrect,
      cardValue: this.cardValue,
    );
  }

  EmployeeDialogState changeCard(String? cardValue) {
    return EmployeeDialogState(
      isFirstnameCorrect: this.isFirstnameCorrect,
      isLastnameCorrect: this.isLastnameCorrect,
      cardValue: cardValue,
    );
  }
}