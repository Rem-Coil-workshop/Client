import 'package:flutter/material.dart';

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
        onPressed: () => null,
        child: Text('Добавить сотрудника'),
      ),
    );
  }
}