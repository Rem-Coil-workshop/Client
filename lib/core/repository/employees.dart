import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/json_models/employee.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class EmployeesRepository extends BaseRepository {
  static const BASE_URL = '/v1/employees';
  List<Employee> _employees = [];

  Future<List<Employee>> get employees async {
    final jsons = await _fetchEmployees();
    _employees = jsons.map((json) => json.toEmployee()).toList();
    return _employees;
  }

  Future<Iterable<JsonEmployee>> _fetchEmployees() async {
    final response = await get(BASE_URL);

    if (response.statusCode == HttpStatus.ok) {
      return _parseBody(response);
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка загрузки списка сотрудников',
      );
    }
  }

  Iterable<JsonEmployee> _parseBody(http.Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonEmployee.fromJson(json);
    });
  }

  Future<List<Employee>> addEmployee(Employee employee) async {
    final response = await this.post(
      BASE_URL,
      JsonEmployee.fromEmployee(employee).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      final newEmployeeJson = JsonEmployee.fromJson(jsonDecode(response.body));
      _employees.add(newEmployeeJson.toEmployee());
      return _employees;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка создания сотрудника',
      );
    }
  }

  Future<List<Employee>> deleteEmployee(Employee employee) async {
    final response = await delete('$BASE_URL/${employee.id}');

    if (response.statusCode == HttpStatus.noContent) {
      _employees.removeWhere((e) => e.id == employee.id);
      return _employees;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка удаления сотрудника.',
      );
    }
  }
}
