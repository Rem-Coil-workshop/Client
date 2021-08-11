import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/card.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/websocket_field.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class EmployeeAddDialog extends StatefulWidget {
  EmployeeAddDialog({Key? key});

  @override
  _EmployeeAddDialogState createState() => _EmployeeAddDialogState();
}

class _EmployeeAddDialogState extends State<EmployeeAddDialog> {
  final _bloc = EmployeeBloc();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  EmployeeDialogState _state = EmployeeDialogState.init();

  @override
  void initState() {
    _bloc.outputStateStream.listen(_onStateChanged);

    _firstnameController
        .addListener(() => _bloc.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _bloc.onLastNameChanged(_lastnameController.text));

    super.initState();
  }

  _onStateChanged(EmployeeDialogState state) => setState(() => _state = state);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final config = store.state.settingsState.network;
    _bloc.onOpenDialog(config);

    return AddEntityDialog(
      title: 'Введите данные сотрудника',
      onSuccessButtonPressed: () => _onPressed(context),
      fields: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleTextField(
              hintText: 'Имя сотрудника',
              errorText: 'Имя может состоять только из букв.',
              controller: _firstnameController,
              isValid: _state.isFirstnameCorrect,
            ),
            SimpleTextField(
              hintText: 'Фамилия сотрудника',
              errorText: 'Фамилия может состоять только из букв.',
              controller: _lastnameController,
              isValid: _state.isLastnameCorrect,
            ),
            WebSocketField(card: _state.cardValue),
          ],
        ),
      ),
    );
  }

  bool _onPressed(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    if (_isValidState) {
      final employee = Employee(
        firstname: _firstnameController.text,
        lastname: _lastnameController.text,
        number: int.parse(_state.cardValue!),
      );
      store.dispatch(OnCreateEmployee(employee));
      _clearControllers();
      return true;
    }
    return false;
  }

  bool get _isValidState {
    final isValidFirstname =
        _firstnameController.text.isNotEmpty && _state.isFirstnameCorrect;
    final isValidLastname =
        _lastnameController.text.isNotEmpty && _state.isLastnameCorrect;
    final isCardExists = _state.cardValue?.isNotEmpty ?? false;
    return isValidFirstname && isValidLastname && isCardExists;
  }

  _clearControllers() {
    _firstnameController.clear();
    _lastnameController.clear();
  }

  @override
  void dispose() {
    _bloc.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }
}
