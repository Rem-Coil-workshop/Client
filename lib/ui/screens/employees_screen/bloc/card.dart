import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/network/network.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/core/websocket/websocket_channel.dart';

class EmployeeBloc extends Cubit<EmployeeDialogState> {
  late CardChannel _channel;

  EmployeeBloc() : super(EmployeeDialogState.init()) {
    _channel = CardChannel(onData: onCardValueEntered);
    onOpenDialog();
  }

  onOpenDialog() => NetworkConfigRepository.loadConfig()
      .then((config) => _channel.open(config));

  onCardValueEntered(dynamic data) {
    emit(state.changeCard(data));
  }

  onFirstNameChanged(String firstname) {
    emit(state.setFirstname(_onNameChanged(firstname)));
  }

  onLastNameChanged(String lastname) {
    emit(state.setLastname(_onNameChanged(lastname)));
  }

  _onNameChanged(String name) {
    return isValidInput(name, isWord);
  }

  @override
  Future<void> close() {
    _channel.close();
    return super.close();
  }
}

@immutable
class EmployeeDialogState {
  final bool isFirstnameCorrect;
  final bool isLastnameCorrect;
  final String? cardValue;

  EmployeeDialogState({
    required this.isFirstnameCorrect,
    required this.isLastnameCorrect,
    required this.cardValue,
  });

  factory EmployeeDialogState.init() {
    return EmployeeDialogState(
      isFirstnameCorrect: true,
      isLastnameCorrect: true,
      cardValue: null,
    );
  }

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
