import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/ui/widgets/end_line.dart';
import 'package:slot_service_app/ui/widgets/icon_buttons.dart';

class EmployeeDataRow extends DataRow {
  EmployeeDataRow({
    required Employee employee,
  }) : super(cells: [
          DataCell(Text(employee.firstname)),
          DataCell(Text(employee.lastname)),
          DataCell(Text(employee.number.toString())),
          DataCell(EndLineSingleWidget(
            child: RemoveIconButton(action: OnDeleteEmployee(employee)),
          )),
        ]);
}
