import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/base/base_main_screen.dart';
import 'package:slot_service_app/screens/tasks_screen/widgets/tasks_add_widget.dart';
import 'package:slot_service_app/screens/tasks_screen/widgets/tasks_current_widget.dart';

class TasksScreen extends BaseMainScreen {
  static const String route = '/tasks';

  TasksScreen({Key? key}) : super(key: key, screenIndex: 2, title: 'Задачи');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Column(
      children: [
        AddTaskWidget(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: CurrentTasksWidget(),
          ),
        )
      ],
    );
  }
}
