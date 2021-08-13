import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/permissions_dialog_body.dart';

class PermissionsTable extends StatelessWidget {
  final Iterable<Employee> permittedEmployees;
  final List<Employee> employees;

  const PermissionsTable(this.employees, this.permittedEmployees, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: true,
      columns: [
        DataColumn(
          label: Container(
            width: PermissionEmployeeBody.table_width * .45,
            child: Text('Имя'),
          ),
        ),
        DataColumn(
          label: Container(
            width: PermissionEmployeeBody.table_width * .45,
            child: Text('Фамилия'),
          ),
        ),
      ],
      rows: List.generate(
        employees.length,
        (index) {
          final employee = employees[index];
          return _rowGenerator(
            employee,
            permittedEmployees.contains(employee),
            context.read<TaskPermissionsCubit>().onPermissionChanged,
          );
        },
      ),
    );
  }

  _rowGenerator(
    Employee employee,
    bool isPermitted,
    void Function(Employee, bool) observer,
  ) {
    return DataRow(
      selected: isPermitted,
      onSelectChanged: (value) => observer(employee, value!),
      cells: [
        DataCell(Text(employee.firstname)),
        DataCell(Text(employee.lastname)),
      ],
    );
  }
}
