import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/base/base_main_screen.dart';
import 'package:slot_service_app/screens/employees_screen/widgets/add_employee_button.dart';
import 'package:slot_service_app/screens/employees_screen/widgets/employees_table.dart';

class EmployeesScreen extends BaseMainScreen {
  static const String route = '/employees';

  EmployeesScreen({Key? key})
      : super(key: key, screenIndex: 3, title: 'Сотрудники');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        EmployeesTable(),
        AddEmployeeButton(),
      ],
    );
  }
}
