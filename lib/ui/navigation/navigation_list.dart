import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/navigation/widgets/navigation_item.dart';
import 'package:slot_service_app/ui/navigation/widgets/navigation_logo_item.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/ui/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/ui/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/tasks_screen.dart';
import 'models/navigation_item_info.dart';

class NavigationList extends StatelessWidget {
  final int selectedItem;

  static List<NavigationItemInfo> navigationItems = [
    NavigationItemInfo(
      icon: Icons.all_inbox,
      title: 'Ячейки',
      widget: BoxesScreen(),
    ),
    NavigationItemInfo(
      icon: Icons.task_rounded,
      title: 'Задачи',
      widget: TasksScreen(),
    ),
    NavigationItemInfo(
      icon: Icons.account_box_rounded,
      title: 'Сотрудники',
      widget: EmployeesScreen(),
    ),
    NavigationItemInfo(
      icon: Icons.ballot_outlined,
      title: 'Логи',
      widget: LogsScreen(),
    ),
    NavigationItemInfo(
      icon: Icons.settings_applications,
      title: 'Настройки',
      widget: SettingsScreen(),
    ),
  ];

  const NavigationList({
    Key? key,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: navigationItems.length + 1,
        itemBuilder: (context, index) {
          if (index == 0)
            return NavigationLogoItem();
          else
            return NavigationItem(
              item: navigationItems[index - 1],
              isSelected: index == selectedItem,
            );
        },
      ),
    );
  }
}
