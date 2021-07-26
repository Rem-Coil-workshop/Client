import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/users/widgets/users_table.dart';
import 'package:slot_service_app/ui/widgets/add_entity_dialog.dart';
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

class UserAddDialog extends AddEntityDialog {
  const UserAddDialog({Key? key}) : super(key: key, title: 'Введите данные пользователя');

  @override
  Widget getActions(BuildContext context) {
    // TODO: implement getActions
    throw UnimplementedError();
  }

  @override
  Widget getFields(BuildContext context) {
    // TODO: implement getFields
    throw UnimplementedError();
  }
}
