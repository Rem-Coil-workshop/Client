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
                  height: 16,
                  child: _StatusText(
                    hasError: employees != null && state.hasError,
                    hasEmployees: employees != null && employees!.isEmpty,
                    error: state.error,
                  ),
                ),
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
}

class _StatusText extends StatelessWidget {
  final onEmptyEmployeesText =
      'Список рабочих пуст или произошла ошибка загрузки данных, попробуйте позже';
  final bool hasError;
  final String? error;
  final bool hasEmployees;

  const _StatusText({
    Key? key,
    required this.error,
    required this.hasEmployees,
    required this.hasError,
  })  : assert(!hasError || error != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasError) return Text(error!);
    if (hasEmployees) return Text(onEmptyEmployeesText);
    return Container();
  }
}
