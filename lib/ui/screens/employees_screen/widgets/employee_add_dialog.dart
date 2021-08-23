import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/state.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';
import 'package:slot_service_app/ui/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/widgets/websocket_field.dart';

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
    _firstnameController.addListener(
        () => _cubit.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _cubit.onLastNameChanged(_lastnameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeCubit, EmployeeDialogState>(
      bloc: _cubit,
      listenWhen: (previous, current) =>
          current.isValid && current.isButtonPressed,
      listener: (context, state) => _onValidInput(context, state.employee),
      builder: (context, state) {
        return AddEntityDialog(
          title: 'Введите данные сотрудника',
          onSuccessButtonPressed: _cubit.onButtonPressed,
          fields: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleTextField(
                  hintText: 'Имя сотрудника',
                  errorText: state.errorMessages[FIRSTNAME_KEY],
                  controller: _firstnameController,
                ),
                SimpleTextField(
                  hintText: 'Фамилия сотрудника',
                  errorText: state.errorMessages[LASTNAME_KEY],
                  controller: _lastnameController,
                ),
                WebSocketField(card: state.cardValue),
              ],
            ),
          ),
        );
      },
    );
  }

  _onValidInput(BuildContext context, Employee employee) {
    StoreProvider.of<AppState>(context).dispatch(OnCreateEmployee(employee));
    _clearControllers();
    Navigator.pop(context);
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
