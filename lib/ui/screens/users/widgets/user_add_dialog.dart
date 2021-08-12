import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
  final _bloc = UserCubit();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstnameController
        .addListener(() => _bloc.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _bloc.onLastNameChanged(_lastnameController.text));

    _passwordController
        .addListener(() => _bloc.onPasswordChanged(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserDialogState>(
      bloc: _bloc,
      listenWhen: (previous, current) => current.isValid && current.isReady,
      listener: (context, state) =>
          _onValidInput(context, state.user, state.password),
      buildWhen: (previous, current) => true,
      builder: (context, state) => _dialog(context, state),
    );
  }

  Widget _dialog(BuildContext context, UserDialogState state) {
    return AddEntityDialog(
      title: 'Введите данные пользователя',
      onSuccessButtonPressed: _bloc.onButtonPressed,
      fields: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleTextField(
              hintText: 'Имя сотрудника',
              errorText: state.errorMessages[UserCubit.FIRSTNAME_KEY],
              controller: _firstnameController,
            ),
            SimpleTextField(
              hintText: 'Фамилия сотрудника',
              errorText: state.errorMessages[UserCubit.LASTNAME_KEY],
              controller: _lastnameController,
            ),
            UserSelectField(
              role: state.role,
              onChanged: _bloc.onUserRoleChanged,
            ),
            SimpleTextField(
              hintText: 'Пароль',
              errorText: state.errorMessages[UserCubit.PASSWORD_KEY],
              controller: _passwordController,
              isObscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  _onValidInput(BuildContext context, User user, String password) {
    StoreProvider.of<AppState>(context).dispatch(OnSingUp(user, password));
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
    _bloc.close();
    super.dispose();
  }
}
