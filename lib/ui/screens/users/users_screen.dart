import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_add_dialog.dart';
import 'package:slot_service_app/ui/screens/users/widgets/users_table.dart';
import 'package:slot_service_app/ui/widgets/open_dialog_button.dart';

class UsersScreen extends BaseMainScreen {
  static const route = '/users';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;

  UsersScreen({Key? key})
      : super(key: key, screenIndex: 6, title: 'Пользователи');

  @override
  String get currentRoute => route;

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