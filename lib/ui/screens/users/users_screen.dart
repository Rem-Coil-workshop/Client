import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_add_dialog.dart';
import 'package:slot_service_app/ui/screens/users/widgets/users_table.dart';
import 'package:slot_service_app/ui/widgets/open_dialog_button.dart';

class UsersScreen extends StatelessWidget {
  static const route = '/users';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;
  static const screenNumber = 5;

  UsersScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: screenNumber,
      title: 'Пользователи',
      currentRoute: route,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          UsersTable(),
          OpenDialogButton(
            name: 'Добавить пользователя',
            dialog: UserAddDialog(),
          ),
        ],
      ),
    );
  }
}