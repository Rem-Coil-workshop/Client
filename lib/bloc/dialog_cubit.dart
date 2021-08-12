import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/utils/validation.dart';

abstract class DialogCubit<State extends FormDialogState> extends Cubit<State> {
  DialogCubit(State initialState) : super(initialState);

  List<ValidationRule> get validationRules;

  FormDialogState onFieldChanged(
    String fieldKey,
    String fieldValue,
    String? Function(String) validate,
  ) {
    return state
        .addFieldValueMessage(fieldKey, fieldValue)
        .addErrorMessage(fieldKey, validate(fieldValue));
  }

  onButtonPressed() {
    State newState = state;
    for (var rule in validationRules) {
      newState = newState.addErrorMessage(
        rule.fieldKey,
        validateNullableField(newState.fields[rule.fieldKey], rule.validate),
      ) as State;
    }
    emit(newState.onButtonPressed(newState.isValid));
  }

  String? validateNullableField(
    String? fieldValue,
    String? Function(String) validate,
  ) {
    if (fieldValue == null) return 'Поле не должно быть пустым';
    return validate(fieldValue);
  }

  String? isValidName(String name) {
    if (name.isEmpty) return 'Поле не должно быть пустым';
    if (!isValidInput(name, isWord)) return 'Допустимы только буквы';
    return null;
  }

  String? isValidPassword(String password) {
    if (password.isEmpty) return 'Поле не должно быть пустым';
    return null;
  }

  @override
  void emit(FormDialogState state) {
    super.emit(state as State);
  }
}

class ValidationRule {
  final String fieldKey;
  final String? Function(String) validate;

  ValidationRule(this.fieldKey, this.validate);
}
