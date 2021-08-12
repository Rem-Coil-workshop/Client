import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/network/network.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/core/websocket/websocket_channel.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/state.dart';

class EmployeeCubit extends Cubit<EmployeeDialogState> {
  late CardChannel _channel;

  EmployeeCubit() : super(EmployeeDialogState.init) {
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
