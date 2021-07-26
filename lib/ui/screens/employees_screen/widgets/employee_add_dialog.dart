import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/websocket_field.dart';
import 'package:slot_service_app/ui/widgets/add_entity_dialog.dart';

class EmployeeAddDialog extends AddEntityDialog {
  final _firstnameField = SimpleTextField(
    hintText: 'Имя сотрудника',
    errorText: 'Имя может состоять только из букв.',
    isValidCharacter: isWord,
  );

  final _lastnameField = SimpleTextField(
    hintText: 'Фамилия сотрудника',
    errorText: 'Фамилия может состоять только из букв.',
    isValidCharacter: isWord,
  );

  final _numberField = WebSocketField();

  EmployeeAddDialog({Key? key})
      : super(key: key, title: 'Введите данные сотрудника');

  @override
  Widget getActions(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            if (_firstnameField.isValid &&
                _lastnameField.isValid &&
                _numberField.isValid) {
              store.dispatch(
                OnCreateEmployee(
                  Employee(
                    firstname: _firstnameField.value,
                    lastname: _lastnameField.value,
                    number: int.parse(_numberField.value),
                  ),
                ),
              );
              Navigator.pop(context);
            }
          },
          child: Text('Добавить'),
        ),
        SizedBox(width: defaultPadding),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Отмена'),
        ),
      ],
    );
  }

  @override
  Widget getFields(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _firstnameField,
            _lastnameField,
            _numberField,
          ],
        ),
      ),
    );
  }
}
