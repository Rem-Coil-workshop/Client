import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_select_field.dart';
import 'package:slot_service_app/ui/widgets/add_entity_dialog.dart';
import 'package:slot_service_app/core/models/user.dart';

class UserAddDialog extends AddEntityDialog {
  final _firstnameField = SimpleTextField(
    hintText: 'Имя сотрудника',
    errorText: 'Имя сотрудника должно содержать только буквы',
    isValidCharacter: isWord,
  );

  final _lastnameField = SimpleTextField(
    hintText: 'Фамилия сотрудника',
    errorText: 'Фамилия сотрудника должна содеражться только буквы',
    isValidCharacter: isWord,
  );

  final _roleField = UserSelectField();

  final _passwordField = SimpleTextField(
    hintText: 'Пароль',
    errorText: 'Неверный формат пароля',
    isValidCharacter: isAll,
    isObscureText: true,
  );

  UserAddDialog({Key? key})
      : super(key: key, title: 'Введите данные пользователя');

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
                _roleField.isValid &&
                _passwordField.isValid) {
              final user = User(
                firstname: _firstnameField.value,
                lastname: _lastnameField.value,
                role: _roleField.value,
              );
              store.dispatch(OnSingUp(user, _passwordField.value));
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
            _roleField,
            _passwordField,
          ],
        ),
      ),
    );
  }
}
