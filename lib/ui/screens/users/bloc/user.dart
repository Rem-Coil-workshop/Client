import 'dart:async';

import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/utils/validation.dart';

class UserBloc {
  UserDialogState _state = UserDialogState.init();
  final _outputController = StreamController<UserDialogState>();

  Stream<UserDialogState> get outputStateStream => _outputController.stream;

  UserBloc() {
    _outputController.sink.add(_state);
  }

  onFirstNameChanged(String firstname) {
    _state.isFirstnameCorrect = _onNameChanged(firstname);
    _outputController.sink.add(_state);
  }

  onLastNameChanged(String lastname) {
    _state.isLastnameCorrect = _onNameChanged(lastname);
    _outputController.sink.add(_state);
  }

  _onNameChanged(String name) {
    return isValidInput(name, isWord);
  }

  onUserRoleChanged(RoleHolder? role) {
    _state.role = role;
    _outputController.sink.add(_state);
  }

  void dispose() {
    _outputController.close();
  }
}

class UserDialogState {
  bool isFirstnameCorrect;
  bool isLastnameCorrect;
  RoleHolder? role;

  UserDialogState({
    required this.isFirstnameCorrect,
    required this.isLastnameCorrect,
    required this.role,
  });

  factory UserDialogState.init() {
    return UserDialogState(
      isFirstnameCorrect: true,
      isLastnameCorrect: true,
      role: null,
    );
  }
}
