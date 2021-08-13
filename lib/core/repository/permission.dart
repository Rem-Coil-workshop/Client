import 'dart:convert';

import 'package:slot_service_app/core/json_models/employee.dart';
import 'package:slot_service_app/core/json_models/task.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/base.dart';

import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart';

class TaskPermissionsRepository extends BaseRepository {
  static const BASE_URL = '/v1/permissions';

  final Task _task;
  final List<Employee> _employees;

  TaskPermissionsRepository(this._task) : _employees = [];

  List<Employee> get employees => _employees;

  Future<bool> fetchEmployees() async {
    final response = await getWithParams(
      '$BASE_URL/employees',
      {'task': _task.id.toString()},
    );

    if (response.statusCode == HttpStatus.ok) {
      final permittedEmployees =
          _parseEmployeesList(response).map((json) => json.toEmployee());
      _updateEmployees(permittedEmployees);
      return true;
    }
    return false;
  }

  Iterable<JsonEmployee> _parseEmployeesList(http.Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonEmployee.fromJson(json);
    });
  }

  _updateEmployees(Iterable<Employee> employees) {
    _employees.clear();
    _employees.addAll(employees);
  }

  Future<bool> addPermissionForEmployee(Employee employee) async {
    final response = await post(BASE_URL, _generatePermissionJson(employee));
    if (response.statusCode == HttpStatus.ok) {
      _employees.add(employee);
      return true;
    }
    return false;
  }

  Future<bool> removePermissionForEmployee(Employee employee) async {
    final response = await deleteWithBody(
      BASE_URL,
      _generatePermissionJson(employee),
    );
    if (response.statusCode == HttpStatus.noContent) {
      _employees.remove(employee);
      return true;
    }
    return false;
  }

  Map<String, Map<String, dynamic>> _generatePermissionJson(Employee employee) {
    final jsonEmployee = JsonEmployee.fromEmployee(employee);
    final jsonTask = JsonTask.fromTask(_task);

    return {
      'employee': jsonEmployee.toJson(),
      'task': jsonTask.toJson(),
    };
  }
}
