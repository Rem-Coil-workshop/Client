import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/employee.dart';

part 'employees.freezed.dart';

@freezed
class EmployeesViewModel with _$EmployeesViewModel {
  const factory EmployeesViewModel.success({
    required List<Employee> employees,
  }) = Success;

  const factory EmployeesViewModel.empty() = Empty;

  const factory EmployeesViewModel.load() = Load;
}