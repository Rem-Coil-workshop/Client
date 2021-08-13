import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:slot_service_app/core/models/employee.dart';

@immutable
class TaskPermissionsState {
  final Status _status;
  final Iterable<Employee>? _data;
  final String? _errorMessage;

  TaskPermissionsState._(this._status, this._data, this._errorMessage);

  factory TaskPermissionsState.load() =>
      TaskPermissionsState._(Status.load, null, null);

  factory TaskPermissionsState.withData(Iterable<Employee> employees) {
    return TaskPermissionsState._(Status.data, employees, null);
  }

  factory TaskPermissionsState.error({
    String message = 'Ошибка загрузки данных',
  }) {
    return TaskPermissionsState._(Status.error, null, message);
  }

  bool get isLoad => _status == Status.load;

  bool get hasData => _data != null;

  Iterable<Employee> get data => _data!;

  String get error => _errorMessage!;

  bool get hasError => _errorMessage != null;

  TaskPermissionsState addError(String errorMessage) {
    return TaskPermissionsState._(Status.error, _data, errorMessage);
  }

  TaskPermissionsState addLoad() {
    return TaskPermissionsState._(Status.load, _data, _errorMessage);
  }
}

enum Status { init, load, data, error }
