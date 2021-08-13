import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/cubit.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/state.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/permissions_table.dart';

class PermissionEmployeeBody extends StatelessWidget {
  static const table_width = 1000.0;
  final List<Employee>? employees;

  const PermissionEmployeeBody({
    Key? key,
    required this.employees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: PermissionEmployeeBody.table_width,
        child: BlocBuilder<TaskPermissionsCubit, TaskPermissionsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 13,
                  child: _status(state),
                ),
                SizedBox(height: 3),
                SizedBox(
                  height: 4,
                  child: employees == null || state.isLoad
                      ? LinearProgressIndicator(backgroundColor: Colors.white)
                      : null,
                ),
                if (employees != null && employees!.isNotEmpty && state.hasData)
                  PermissionsTable(employees!, state.data),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget? _status(TaskPermissionsState state) {
    if (employees != null && state.hasError) return Text(state.error);
    if (employees != null && employees!.isEmpty)
      return Text(
          'Список рабочих пуст или произошла ошибка загрузки данных, попробуйте позже');
  }
}
