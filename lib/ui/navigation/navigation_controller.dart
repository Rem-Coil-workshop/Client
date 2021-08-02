import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/navigation/models/navigation_item_info.dart';
import 'package:slot_service_app/ui/navigation/navigation_list.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/ui/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/ui/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/ui/screens/logs_server_screen/logs_server_screen.dart';
import 'package:slot_service_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/tasks_screen.dart';
import 'package:slot_service_app/ui/screens/users/users_screen.dart';

class NavigationController extends StatelessWidget {
  static final screenList = [
    NavigationItemInfo(
      icon: Icons.all_inbox,
      title: 'Ячейки',
      route: BoxesScreen.route,
      privacyLevel: BoxesScreen.privacyLevel,
      index: BoxesScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.task_rounded,
      title: 'Задачи',
      route: TasksScreen.route,
      privacyLevel: TasksScreen.privacyLevel,
      index: TasksScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.account_box_rounded,
      title: 'Сотрудники',
      route: EmployeesScreen.route,
      privacyLevel: EmployeesScreen.privacyLevel,
      index: EmployeesScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.ballot_outlined,
      title: 'Логи',
      route: LogsScreen.route,
      privacyLevel: LogsScreen.privacyLevel,
      index: LogsScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.settings_applications,
      title: 'Настройки',
      route: SettingsScreen.route,
      privacyLevel: SettingsScreen.privacyLevel,
      index: SettingsScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.supervised_user_circle_rounded,
      title: 'Пользователи',
      route: UsersScreen.route,
      privacyLevel: UsersScreen.privacyLevel,
      index: UsersScreen.screenNumber,
    ),
    NavigationItemInfo(
      icon: Icons.ballot_outlined,
      title: 'Логи системы',
      route: ServerLogsScreen.route,
      privacyLevel: ServerLogsScreen.privacyLevel,
      index: ServerLogsScreen.screenNumber,
    ),
  ];

  final int currentScreen;

  const NavigationController({Key? key, required this.currentScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final user = store.state.authState.currentUser;
    final privacyLevel = user?.role.index ?? EMPLOYEE_PRIVACY_LEVEL;

    screenList..sort((a, b) => a.index.compareTo(b.index));
    final items = screenList
      ..where((screen) => screen.privacyLevel >= privacyLevel)
      ..toList();

    return NavigationList(navigationItems: items, selectedItem: currentScreen);
  }
}
