import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/employees_screen/widgets/simple_text_field.dart';

import 'dialog_title.dart';

class AddEmployeeDialog extends StatelessWidget {
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

  final _numberField = SimpleTextField(
    hintText: 'Номер сотрудника',
    errorText: 'Номер может состоять только из цифр.',
    isValidCharacter: isDigit,
  );

  AddEmployeeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 2 * defaultPadding,
          top: 2 * defaultPadding,
          right: 2 * defaultPadding,
          bottom: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogTitle(title: 'Введите данные сотрудника'),
            _getFields(),
            SizedBox(height: defaultPadding),
            _getActions(context),
          ],
        ),
      ),
    );
  }

  Widget _getFields() {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            _firstnameField,
            _lastnameField,
            _numberField,
          ],
        ),
      ),
    );
  }

  Widget _getActions(BuildContext context) {
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
}
