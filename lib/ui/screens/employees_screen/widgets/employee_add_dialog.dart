import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/state.dart';
import 'package:slot_service_app/ui/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/widgets/websocket_field.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class EmployeeAddDialog extends StatefulWidget {
  EmployeeAddDialog({Key? key});

  @override
  _EmployeeAddDialogState createState() => _EmployeeAddDialogState();
}

class _EmployeeAddDialogState extends State<EmployeeAddDialog> {
  final _cubit = EmployeeCubit();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstnameController
        .addListener(() => _cubit.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _cubit.onLastNameChanged(_lastnameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeDialogState>(
      bloc: _cubit,
      builder: (context, state) => AddEntityDialog(
        title: 'Введите данные сотрудника',
        // todo
        onSuccessButtonPressed: () => _onPressed(context),
        fields: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleTextField(
                hintText: 'Имя сотрудника',
                // todo
                errorText: 'Имя может состоять только из букв.',
                controller: _firstnameController,
              ),
              SimpleTextField(
                hintText: 'Фамилия сотрудника',
                // todo
                errorText: 'Фамилия может состоять только из букв.',
                controller: _lastnameController,
              ),
              WebSocketField(card: state.cardValue),
            ],
          ),
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
        number: int.parse(_cubit.state.cardValue!),
      );

      store.dispatch(OnCreateEmployee(employee));
      _clearControllers();
      return true;
    }
    return false;
  }

  bool get _isValidState {
    final isValidFirstname =
        _firstnameController.text.isNotEmpty && _cubit.state.isFirstnameCorrect;
    final isValidLastname =
        _lastnameController.text.isNotEmpty && _cubit.state.isLastnameCorrect;
    final isCardExists = _cubit.state.cardValue?.isNotEmpty ?? false;
    return isValidFirstname && isValidLastname && isCardExists;
  }

  _clearControllers() {
    _firstnameController.clear();
    _lastnameController.clear();
  }

  @override
  void dispose() {
    _cubit.close();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }
}
