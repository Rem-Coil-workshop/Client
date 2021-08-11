import 'dart:async';

import 'package:slot_service_app/core/network/network.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/core/websocket/websocket_channel.dart';

class EmployeeBloc {
  late CardChannel _channel;
  EmployeeDialogState _state = EmployeeDialogState.init();

  final _outputController = StreamController<EmployeeDialogState>();

  Stream<EmployeeDialogState> get outputStateStream => _outputController.stream;

  EmployeeBloc() {
    _channel = CardChannel(onData: onCardValueEntered);
    _outputController.sink.add(_state);
  }

  onOpenDialog() => NetworkConfigRepository.loadConfig()
      .then((config) => _channel.open(config));

  onCardValueEntered(dynamic data) {
    _state.cardValue = data;
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

  onCloseDialog() {
    _channel.close();
  }

  void dispose() {
    onCloseDialog();
    _outputController.close();
  }
}

class EmployeeDialogState {
  bool isFirstnameCorrect;
  bool isLastnameCorrect;
  String? cardValue;

  factory EmployeeDialogState.init() {
    return EmployeeDialogState(
      isFirstnameCorrect: true,
      isLastnameCorrect: true,
      cardValue: null,
    );
  }

  EmployeeDialogState({
    required this.isFirstnameCorrect,
    required this.isLastnameCorrect,
    required this.cardValue,
  });
}
