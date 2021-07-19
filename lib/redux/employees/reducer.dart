import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/employees/actions.dart';
import 'package:slot_service_app/redux/employees/state.dart';

final employeesReducer = combineReducers<EmployeesState>([
  TypedReducer<EmployeesState, SetEmployeesAction>(_setEmployees),
]);

EmployeesState _setEmployees(EmployeesState state, SetEmployeesAction action) =>
    state.copyWith(employees: action.employees);