import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/user/thunk.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/simple_text_field.dart';
import 'package:slot_service_app/ui/screens/users/bloc/user.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_select_field.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class UserAddDialog extends StatefulWidget {
  UserAddDialog({Key? key});

  @override
  _UserAddDialogState createState() => _UserAddDialogState();
}

class _UserAddDialogState extends State<UserAddDialog> {
  final _bloc = UserBloc();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passwordController = TextEditingController();

  UserDialogState _state = UserDialogState.init();

  @override
  void initState() {
    super.initState();
    _bloc.outputStateStream.listen(_onStateChanged);

    _firstnameController
        .addListener(() => _bloc.onFirstNameChanged(_firstnameController.text));

    _lastnameController
        .addListener(() => _bloc.onLastNameChanged(_lastnameController.text));
  }

  _onStateChanged(UserDialogState state) => setState(() => _state = state);

  @override
  Widget build(BuildContext context) {
    return AddEntityDialog(
      title: 'Введите данные пользователя',
      onSuccessButtonPressed: () => _onPressed(context),
      fields: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleTextField(
              hintText: 'Имя сотрудника',
              errorText: 'Имя сотрудника должно содержать только буквы',
              controller: _firstnameController,
              isValid: _state.isFirstnameCorrect,
            ),
            SimpleTextField(
              hintText: 'Фамилия сотрудника',
              errorText: 'Фамилия сотрудника должна содеражться только буквы',
              controller: _lastnameController,
              isValid: _state.isLastnameCorrect,
            ),
            UserSelectField(
              role: _state.role,
              onChanged: _bloc.onUserRoleChanged,
            ),
            SimpleTextField(
              hintText: 'Пароль',
              errorText: 'Неверный формат пароля',
              controller: _passwordController,
              isValid: true,
              isObscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  bool _onPressed(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    if (_isValidState) {
      final user = User(
        firstname: _firstnameController.text,
        lastname: _lastnameController.text,
        role: _state.role!.role,
      );
      store.dispatch(OnSingUp(user, _passwordController.text));
      _clearControllers();

      return true;
    }
    return false;
  }

  _clearControllers() {
    _firstnameController.clear();
    _lastnameController.clear();
    _passwordController.clear();
  }

  bool get _isValidState {
    final isValidFirstname =
        _firstnameController.text.isNotEmpty && _state.isFirstnameCorrect;
    final isValidLastname =
        _lastnameController.text.isNotEmpty && _state.isLastnameCorrect;
    final isRoleSelected = _state.role != null;
    final isPasswordValid = _passwordController.text.isNotEmpty;

    return isValidFirstname &&
        isValidLastname &&
        isRoleSelected &&
        isPasswordValid;
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
