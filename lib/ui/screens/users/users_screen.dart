import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/view_models/user.dart';
import 'package:slot_service_app/ui/widgets/open_dialog_button.dart';

class UsersScreen extends BaseMainScreen {
  static const route = '/users';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;

  UsersScreen({Key? key})
      : super(key: key, screenIndex: 6, title: 'Пользователи');

  @override
  Widget getMainWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        UsersTable(),
        OpenDialogButton(
          name: 'Добавить пользователя',
          dialog: UserAddDialog(),
        ),
      ],
    );
  }
}

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
            success: (users) => Column(
              children: [
                UserList(
                  title: 'Администраторы',
                  users: users
                      .where((element) => element.role == UserRole.ADMIN)
                      .toList(),
                ),
                SizedBox(height: defaultPadding * 2),
                UserList(
                  title: 'Обычные пользователи',
                  users: users
                      .where((element) => element.role == UserRole.EMPLOYEE)
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

class UserList extends StatelessWidget {
  final _controller = ScrollController();
  final String _title;
  final List<User> _users;

  UserList({
    Key? key,
    required String title,
    required List<User> users,
  })  : _title = title,
        _users = users,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(2 * defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Scrollbar(
          controller: _controller,
          child: ListView.builder(
            controller: _controller,
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return Text(
                '${user.lastname}',
                style: Theme.of(context).textTheme.headline6,
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserAddDialog extends StatelessWidget {
  const UserAddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
