import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_list.dart';
import 'package:slot_service_app/ui/view_models/user.dart';

class UsersTable extends StatelessWidget {
  UsersTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: StoreConnector<AppState, UserViewModel>(
          onInit: (store) => store.dispatch(OnGetUsers()),
          converter: (store) =>
              UserViewModel.success(users: store.state.authState.users),
          builder: (context, vm) => vm.when(
            success: (users) => Row(
              children: [
                UserList(
                  title: 'Обычные пользователи',
                  users: users
                      .where((element) => element.role == UserRole.EMPLOYEE)
                      .toList(),
                ),
                SizedBox(width: defaultPadding * 2),
                UserList(
                  title: 'Администраторы',
                  users: users
                      .where((element) => element.role == UserRole.ADMIN)
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}