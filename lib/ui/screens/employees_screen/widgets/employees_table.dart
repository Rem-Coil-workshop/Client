import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/employees_data_row.dart';

class EmployeesTable extends StatelessWidget {
  final List<Employee> employees;

  const EmployeesTable({Key? key, required this.employees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          showCheckboxColumn: false,
          columnSpacing: defaultPadding,
          columns: [
            DataColumn(label: Text('Имя')),
            DataColumn(label: Text('Фамилия')),
            DataColumn(label: Text('Номер пропуска')),
            DataColumn(label: Container()),
          ],
          rows: List.generate(
            employees.length,
            (index) => EmployeeDataRow(employee: employees[index]),
          ),
        ),
      ),
    );
  }
}
