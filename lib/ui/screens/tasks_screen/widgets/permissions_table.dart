import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/state.dart';

class PermissionEmployeeTable extends StatefulWidget {
  static const table_width = 1000.0;
  final List<Employee> employees;

  const PermissionEmployeeTable({
    Key? key,
    required this.employees,
  }) : super(key: key);

  @override
  _PermissionEmployeeTableState createState() =>
      _PermissionEmployeeTableState();
}

class _PermissionEmployeeTableState extends State<PermissionEmployeeTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: PermissionEmployeeTable.table_width,
        child: BlocBuilder<TaskPermissionsCubit, TaskPermissionsState>(
          builder: (context, state) {
            if (state.hasData) {
              return _table(state.data, state.errorMessage);
            }
            return Text('Ошибка загрузки');
          },
        ),
      ),
    );
  }

  _table(Iterable<Employee> permittedEmployees, String? error) {
    return Column(
      children: [
        DataTable(
          showCheckboxColumn: true,
          columns: [
            DataColumn(
              label: Container(
                width: PermissionEmployeeTable.table_width * .45,
                child: Text('Имя'),
              ),
            ),
            DataColumn(
              label: Container(
                width: PermissionEmployeeTable.table_width * .45,
                child: Text('Фамилия'),
              ),
            ),
          ],
          rows: List.generate(
            widget.employees.length,
            (index) {
              final employee = widget.employees[index];
              return _rowGenerator(
                  employee, permittedEmployees.contains(employee));
            },
          ),
        ),
        if (error != null) Text(error),
      ],
    );
  }

  _rowGenerator(Employee employee, bool isPermitted) {
    return DataRow(
      selected: isPermitted,
      onSelectChanged: (value) {
        setState(() {
          final cubit = context.read<TaskPermissionsCubit>();
          if (value!)
            cubit.onAddPermission(employee);
          else
            cubit.onRemovePermission(employee);
        });
      },
      cells: [
        DataCell(Text(employee.firstname)),
        DataCell(Text(employee.lastname)),
      ],
    );
  }
}
