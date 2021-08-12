import 'package:slot_service_app/bloc/dialog_cubit.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/network/network.dart';
import 'package:slot_service_app/core/websocket/websocket_channel.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/state.dart';

class EmployeeCubit extends DialogCubit<EmployeeDialogState> {
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
    emit(onFieldChanged(FIRSTNAME_KEY, firstname, isValidName));
  }

  onLastNameChanged(String lastname) {
    emit(onFieldChanged(LASTNAME_KEY, lastname, isValidName));
  }

  @override
  List<ValidationRule> get validationRules => [
    ValidationRule(FIRSTNAME_KEY, isValidName),
    ValidationRule(LASTNAME_KEY, isValidName),
  ];

  @override
  Future<void> close() {
    _channel.close();
    return super.close();
  }
}
