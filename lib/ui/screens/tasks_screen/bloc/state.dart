import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:slot_service_app/core/models/employee.dart';

@immutable
class TaskPermissionsState {
  final AsyncSnapshot<List<Employee>> _data;

  TaskPermissionsState._(this._data);

  factory TaskPermissionsState.init() =>
      TaskPermissionsState._(AsyncSnapshot.nothing());

  factory TaskPermissionsState.load() =>
      TaskPermissionsState._(AsyncSnapshot.waiting());

  factory TaskPermissionsState.withData(List<Employee> employees) {
    return TaskPermissionsState._(
      AsyncSnapshot.withData(ConnectionState.done, employees),
    );
  }

  factory TaskPermissionsState.error({
    String message = 'Ошибка загрузки данных',
  }) {
    return TaskPermissionsState._(
      AsyncSnapshot.withError(ConnectionState.done, message),
    );
  }

  List<Employee>? get data => _data.data;

  bool get isLoad => _data.connectionState == ConnectionState.waiting;

  bool get hasData => _data.hasData;

  String get errorMessage => _data.error as String;

  TaskPermissionsState addEmployee(Employee employee) {
    List<Employee> employees = List.from(_data.data!)..add(employee);
    return TaskPermissionsState.withData(employees);
  }

  TaskPermissionsState removeEmployee(Employee employee) {
    List<Employee> employees = List.from(_data.data!)..remove(employee);
    return TaskPermissionsState.withData(employees);
  }
}
