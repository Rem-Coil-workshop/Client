import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_add_widget.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_current_list.dart';

class TasksScreen extends BaseMainScreen {
  static const route = '/tasks';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  TasksScreen({Key? key}) : super(key: key, screenIndex: 2, title: 'Задачи');

  @override
  Widget getMainWidget(BuildContext context) {
    return Column(
      children: [
        AddTaskWidget(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: CurrentTasksList(),
          ),
        )
      ],
    );
  }
}
