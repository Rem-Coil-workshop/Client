import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/permissions_dialog_body.dart';
import 'package:slot_service_app/ui/widgets/dialog.dart';

class PermissionsDialog extends StatelessWidget {
  final Task task;

  const PermissionsDialog({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullScreenDialog(
      title: 'Выбререте допущеных сотрудников',
      body: StoreConnector<AppState, List<Employee>?>(
        onInit: (store) => store.dispatch(OnFetchEmployees()),
        converter: (store) {
          if (store.state.statusState.isLoad) return null;
          return store.state.employeesState.employees;
        },
        builder: (context, employees) => BlocProvider(
            create: (context) => TaskPermissionsCubit(task),
            child: PermissionEmployeeBody(employees: employees),
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
