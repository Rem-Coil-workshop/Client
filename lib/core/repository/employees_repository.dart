import 'dart:convert';

import 'package:http/http.dart';
import 'package:slot_service_app/core/json_models/employee.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class EmployeesRepository extends BaseRepository {
  List<Employee> _employees = [];

  Future<List<Employee>> get employees async {
    final jsons = await _fetchEmployees();
    _employees = jsons.map((json) => json.toEmployee()).toList();
    return _employees;
  }

  Future<Iterable<JsonEmployee>> _fetchEmployees() async {
    final response = await client.get('/v1/employees');

    if (response.statusCode == 200) {
      return _parseBody(response);
    } else {
      throw NetworkException(
        code: response.statusCode,
        message: 'Ошибка загрузки списка сотрудников',
      );
    }
  }

  Iterable<JsonEmployee> _parseBody(Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonEmployee.fromJson(json);
    });
  }

  Future<List<Employee>> addEmployee(Employee employee) async {
    final response = await client.post(
      '/v1/employees',
      JsonEmployee.fromEmployee(employee).toJson(),
    );

    if (response.statusCode == 200) {
      final body =
          JsonEmployee.fromJson(jsonDecode(response.body)).toEmployee();
      _employees.add(body);
      return _employees;
    } else {
      throw NetworkException(
        code: response.statusCode,
        message:
            'Ошибка создания сотрудника. Возможно введено не уникальное значение номера сотрудника.',
      );
    }
  }

  Future<List<Employee>> deleteEmployee(Employee employee) async {
    final response = await client.delete('/v1/employees/${employee.id}');


    if (response.statusCode == 204) {
      _employees.removeWhere((e) => e.id == employee.id);
      return _employees;
    } else {
      throw NetworkException(
        code: response.statusCode,
        message:
        'Ошибка удаления сотрудника.',
      );
    }
  }
}
