import 'package:slot_service_app/bloc/dialog_cubit.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
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

  @override
  List<ValidationRule> get validationRules => [
    ValidationRule(FIRSTNAME_KEY, isValidName),
    ValidationRule(LASTNAME_KEY, isValidName),
    ValidationRule(PASSWORD_KEY, isValidPassword),
  ];

  onUserRoleChanged(RoleHolder? role) {
    emit(state.changeRole(role));
  }
}
