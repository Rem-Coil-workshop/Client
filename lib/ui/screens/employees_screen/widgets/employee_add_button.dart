import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'employee_add_dialog.dart';

class EmployeeAddButton extends StatelessWidget {
  const EmployeeAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: defaultPadding,
      ),
      child: ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => EmployeeAddDialog(),
        ),
        child: Text('Добавить сотрудника'),
      ),
    );
  }
}
