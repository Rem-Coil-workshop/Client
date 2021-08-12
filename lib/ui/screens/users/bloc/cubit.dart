import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/ui/screens/users/bloc/state.dart';

class UserCubit extends Cubit<UserDialogState> {
  static const FIRSTNAME_KEY = 'firstname';
  static const LASTNAME_KEY = 'lastname';
  static const PASSWORD_KEY = 'password';

  UserCubit() : super(UserDialogState.init);

  onFirstNameChanged(String firstname) {
    final newState = state
        .setFirstname(firstname)
        .addErrorMessage(FIRSTNAME_KEY, _isValidName(firstname));

    emit(newState);
  }

  onLastNameChanged(String lastname) {
    final newState = state
        .setLastname(lastname)
        .addErrorMessage(LASTNAME_KEY, _isValidName(lastname));

    emit(newState);
  }

  onPasswordChanged(String password) {
    final newState = state
        .setPassword(password)
        .addErrorMessage(PASSWORD_KEY, _isValidPassword(password));
    emit(newState);
  }

  onButtonPressed() {
    final newState = state
        .addErrorMessage(FIRSTNAME_KEY, _isValidName(state.firstname))
        .addErrorMessage(LASTNAME_KEY, _isValidName(state.lastname))
        .addErrorMessage(PASSWORD_KEY, _isValidPassword(state.password));

    emit(newState.changeReady(newState.isValid));
  }

  onUserRoleChanged(RoleHolder? role) {
    emit(state.changeRole(role));
  }

  String? _isValidPassword(String password) {
    if (password.isEmpty) return 'Поле не должно быть пустым';
    return null;
  }

  String? _isValidName(String name) {
    if (name.isEmpty) return 'Поле не должно быть пустым';
    if (!isValidInput(name, isWord)) return 'Допустимы только буквы';
    return null;
  }
}
