import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/user/thunk.dart';

class ExitAppDialog extends StatelessWidget {
  const ExitAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return AlertDialog(
      title: Text('Выйти из системы?'),
      content: Text('Далее понадобится повторная авторизация.'),
      actions: [
        TextButton(
          onPressed: () {
            store.dispatch(OnExitApp());
            Navigator.pop(context);
          },
          child: Text('Да'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Нет'),
        ),
      ],
    );
  }
}
