import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/employee.dart';

part 'state.freezed.dart';

@freezed
class EmployeesState with _$EmployeesState {
  static const initState = EmployeesState();

  const factory EmployeesState({
    @Default(<Employee>[]) List<Employee> employees,
  }) = _EmployeesState;
}