import 'package:slot_service_app/bloc/dialog_cubit.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/users/bloc/state.dart';

class UserCubit extends DialogCubit<UserDialogState> {
  UserCubit() : super(UserDialogState.init);

  onFirstNameChanged(String firstname) {
    emit(onFieldChanged(FIRSTNAME_KEY, firstname, isValidName));
  }

  onLastNameChanged(String lastname) {
    emit(onFieldChanged(LASTNAME_KEY, lastname, isValidName));
  }

  onPasswordChanged(String password) {
    emit(onFieldChanged(PASSWORD_KEY, password, isValidPassword));
  }

  onButtonPressed() {
    final newState = state
        .addErrorMessage(
          FIRSTNAME_KEY,
          validateNullableField(state.firstname, isValidName),
        )
        .addErrorMessage(
          LASTNAME_KEY,
          validateNullableField(state.lastname, isValidName),
        )
        .addErrorMessage(
          PASSWORD_KEY,
          validateNullableField(state.password, isValidPassword),
        );

    emit(newState.onButtonPressed(newState.isValid));
  }

  onUserRoleChanged(RoleHolder? role) {
    emit(state.changeRole(role));
  }
}
