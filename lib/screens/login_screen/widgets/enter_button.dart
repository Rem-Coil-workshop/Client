import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';

import '../../../constants.dart';

class EnterButton extends StatelessWidget {
  final Function(String) _onWrongFields;
  final TextEditingController _controller;

  const EnterButton({
    Key? key,
    required Function(String) onWrongFields,
    required TextEditingController passwordController,
  })  : _onWrongFields = onWrongFields,
        _controller = passwordController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: secondaryColor),
            ),
          ),
        ),
        onPressed: () => _validateFields(context),
        child: Text('Войти'),
      ),
    );
  }

  void _validateFields(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    final user = store.state.authState.currentUser;
    final password = _controller.text;

    if (user == null) {
      _onWrongFields('Вы не ввыбрали пользователя');
    } else if (password.isEmpty) {
      _onWrongFields('Вы не ввели пароль');
    } else {
      store.dispatch(OnUserCredentialsEnter(user, password));
    }
  }
}
