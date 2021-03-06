import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_add_widgets.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  static const route = '/tasks';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;
  static const screenNumber = 2;


  TasksScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: screenNumber,
      title: 'Задачи',
      currentRoute: route,
      child: Column(
        children: [
          AddTaskRow(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
