import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/bloc/dialog_state.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/user/thunk.dart';
import 'package:slot_service_app/ui/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/users/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/users/bloc/state.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_select_field.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class UserAddDialog extends StatefulWidget {
  UserAddDialog({Key? key});

  @override
  _UserAddDialogState createState() => _UserAddDialogState();
}

class _UserAddDialogState extends State<UserAddDialog> {
  final _cubit = UserCubit();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstnameController
        .addListener(() => _cubit.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _cubit.onLastNameChanged(_lastnameController.text));

    _passwordController
        .addListener(() => _cubit.onPasswordChanged(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserDialogState>(
      bloc: _cubit,
      listenWhen: (previous, current) =>
          current.isValid && current.isButtonPressed,
      listener: (context, state) =>
          _onValidInput(context, state.user, state.password!),
      builder: _dialog,
    );
  }

  Widget _dialog(BuildContext context, UserDialogState state) {
    return AddEntityDialog(
      title: 'Введите данные пользователя',
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
            UserSelectField(
              role: state.role,
              onChanged: _cubit.onUserRoleChanged,
            ),
            SimpleTextField(
              hintText: 'Пароль',
              errorText: state.errorMessages[PASSWORD_KEY],
              controller: _passwordController,
              isObscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  _onValidInput(BuildContext context, User user, String password) {
    StoreProvider.of<AppState>(context).dispatch(OnUserCreated(user, password));
    Navigator.pop(context);
    _clearControllers();
  }

  _clearControllers() {
    _firstnameController.clear();
    _lastnameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
