import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/view_models/auth.dart';

import '../../../constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Выйти из системы?'),
              content: Text('Далее понадобится повторная авторизация.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    final store = StoreProvider.of<AppState>(context);
                    store.dispatch(OnExitApp());
                  },
                  child: Text('Да'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Нет'),
                ),
              ],
            ),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: secondaryColor),
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding / 2,
              ),
              child: StoreConnector<AppState, AuthViewModel>(
                converter: (store) {
                  final user = store.state.authState.currentUser;
                  if (user == null) {
                    return AuthViewModel.noUser();
                  } else {
                    return AuthViewModel.success(user: user);
                  }
                },
                builder: (context, vm) => vm.when(
                  success: (employee) =>
                      Text("${employee.lastname} ${employee.firstname}"),
                  noUser: () {
                    final store = StoreProvider.of<AppState>(context);
                    store.dispatch(OnEnterInApp());
                    return Text('Без пользователя');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 4,
              ),
              child: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
