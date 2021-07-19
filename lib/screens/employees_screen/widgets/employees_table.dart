import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/employees_screen/view_models/employees.dart';

class EmployeesTable extends StatelessWidget {
  const EmployeesTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: StoreConnector<AppState, EmployeesViewModel>(
              onInit: (store) => store.dispatch(OnFetchEmployees()),
              converter: (store) => EmployeesViewModel.success(
                  employees: store.state.employeesState.employees),
              builder: (context, vm) => vm.when(
                success: (employees) => DataTable(
                  showCheckboxColumn: false,
                  columnSpacing: defaultPadding,
                  columns: [
                    DataColumn(label: Text('Имя')),
                    DataColumn(label: Text('Фамилия')),
                    DataColumn(label: Text('Номер пропуска')),
                  ],
                  rows: List.generate(
                    employees.length,
                        (index) => recentFileDataRow(employees[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TODO - Добавить обработку нажатий
  DataRow recentFileDataRow(Employee employee) {
    return DataRow(
      onSelectChanged: (value) => print(employee.number),
      cells: [
        DataCell(Text(employee.firstname)),
        DataCell(Text(employee.lastname)),
        DataCell(Text(employee.number.toString())),
      ],
    );
  }
}