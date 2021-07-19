import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/employees_screen/widgets/add_employee_dialog.dart';

import '../../../constants.dart';

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({
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
          builder: (context) => AddEmployeeDialog(),
        ),
        child: Text('Добавить сотрудника'),
      ),
    );
  }
}
