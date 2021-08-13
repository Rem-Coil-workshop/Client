import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/permissions_table.dart';
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
          success: (employees) => BlocProvider(
            create: (context) => TaskPermissionsCubit(task),
            child: PermissionEmployeeTable(employees: employees),
          ),
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
