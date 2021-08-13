import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/employees_screen/widgets/employees_table.dart';
import 'package:slot_service_app/ui/view_models/employees.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';

class EmployeesData extends StatelessWidget {
  const EmployeesData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BackgroundContainer(
        child: StoreConnector<AppState, EmployeesViewModel>(
          onInit: (store) => store.dispatch(OnFetchEmployees()),
          converter: (store) {
            if (store.state.statusState.isLoad)
              return EmployeesViewModel.load();

            final employees = store.state.employeesState.employees;
            if (employees.isEmpty) return EmployeesViewModel.empty();
            return EmployeesViewModel.success(employees: employees);
          },
          builder: (context, vm) => vm.when(
            success: (employees) => EmployeesTable(employees: employees),
            empty: () => Center(child: Text('Пока нет ни одного сотрудников')),
            load: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
