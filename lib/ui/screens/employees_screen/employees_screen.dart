import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/widgets/open_dialog_button.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/employee_add_dialog.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/employees_table.dart';

class EmployeesScreen extends StatelessWidget {
  static const route = '/employees';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;
  static const screenNumber = 3;

  EmployeesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: screenNumber,
      title: 'Сотрудники',
      currentRoute: route,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EmployeesTable(),
          OpenDialogButton(
            name: 'Добавить сотрудника',
            dialog: EmployeeAddDialog(),
          ),
        ],
      ),
    );
  }
}