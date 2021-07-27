import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_select_field.dart';
import 'package:slot_service_app/ui/widgets/add_entity_dialog.dart';

class UserAddDialog extends StatelessWidget {
  UserAddDialog({Key? key});

  @override
  Widget build(BuildContext context) {
    return AddEntityDialog(
      title: 'Введите данные пользователя',
      onSuccessButtonPressed: () => _onPressed(context),
      fields: Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SimpleTextField(
              //   hintText: 'Имя сотрудника',
              //   errorText: 'Имя сотрудника должно содержать только буквы',
              //   isValidCharacter: isWord,
              // ),
              // SimpleTextField(
              //   hintText: 'Фамилия сотрудника',
              //   errorText: 'Фамилия сотрудника должна содеражться только буквы',
              //   isValidCharacter: isWord,
              // ),
              UserSelectField(),
              // SimpleTextField(
              //   hintText: 'Пароль',
              //   errorText: 'Неверный формат пароля',
              //   isValidCharacter: isAll,
              //   isObscureText: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  bool _onPressed(BuildContext context) {
    if (_isFieldsValid) {
      // final user = User(
      //   firstname: _firstnameField.value,
      //   lastname: _lastnameField.value,
      //   role: _roleField.value,
      // );
      // store.dispatch(OnSingUp(user, _passwordField.value));
      return true;
    }
    return false;
  }

  bool get _isFieldsValid => true;
}
