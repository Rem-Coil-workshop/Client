import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class EmployeesRepository extends BaseRepository {
  var _employees = [
    Employee(firstname: 'Илья', lastname: 'Родионов', number: 1976534),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
    Employee(firstname: 'Дмитрий', lastname: 'Жарков', number: 8245209),
  ];

  Future<List<Employee>> get employees async => _employees;
}