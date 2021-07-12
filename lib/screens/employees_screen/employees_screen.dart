import 'package:flutter/material.dart';
import 'package:slot_service_app/base/base_main_screen.dart';

class EmployeesScreen extends BaseMainScreen {
  static const String route = '/employees';

  EmployeesScreen({Key? key}) : super(key: key, screenIndex: 3, title: 'Рабочие');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Center(
      child: Text('Employees Screen'),
    );
  }
}
