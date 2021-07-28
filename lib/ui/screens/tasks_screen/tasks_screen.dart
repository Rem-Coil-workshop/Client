import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_add_widget.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_current_list.dart';

class TasksScreen extends StatelessWidget {
  static const route = '/tasks';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  TasksScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: 2,
      title: 'Задачи',
      currentRoute: route,
      child: Column(
        children: [
          AddTaskWidget(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: CurrentTasksList(),
            ),
          )
        ],
      ),
    );
  }
}
