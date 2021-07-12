import 'package:flutter/material.dart';
import 'package:slot_service_app/base/base_main_screen.dart';

class TasksScreen extends BaseMainScreen {
  static const String route = '/tasks';

  TasksScreen({Key? key}) : super(key: key, screenIndex: 2, title: 'Задачи');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Center(
      child: Text('Tasks Screen'),
    );
  }
}
