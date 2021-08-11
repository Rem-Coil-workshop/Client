import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/view_models/employees.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class PermissionsDialog extends StatelessWidget {
  final Task task;

  const PermissionsDialog({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullScreenDialog(
      title: 'Выбререте допущеных сотрудников',
      body: StoreConnector<AppState, EmployeesViewModel>(
        onInit: (store) => store.dispatch(OnFetchEmployees()),
        converter: (store) {
          if (store.state.statusState.isLoad) return EmployeesViewModel.load();

          final employees = store.state.employeesState.employees;
          if (employees.isEmpty) return EmployeesViewModel.empty();
          return EmployeesViewModel.success(employees: employees);
        },
        builder: (context, vm) => vm.when(
          success: (employees) => PermissionEmployeeTable(employees: employees),
          empty: () => Center(
            child: Text(
              'Список рабочих пуст или произошла ошибка загрузки данных, попробуйте позже',
            ),
          ),
          load: () => Center(child: CircularProgressIndicator()),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Закрыть'),
        )
      ],
    );
  }
}

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
  final List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: PermissionEmployeeTable.table_width,
        child: DataTable(
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
            (index) => DataRow(
              selected: selectedIndexes.contains(index),
              onSelectChanged: (value) {
                setState(() {
                  if (value!)
                    selectedIndexes.add(index);
                  else
                    selectedIndexes.remove(index);
                });
              },
              cells: [
                DataCell(Text(widget.employees[index].firstname)),
                DataCell(Text(widget.employees[index].lastname)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
