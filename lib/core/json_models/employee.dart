import 'package:slot_service_app/core/models/employee.dart';

class JsonEmployee {
  final int? id;
  final int number;
  final String name;
  final String surname;

  JsonEmployee({
    this.id,
    required this.number,
    required this.name,
    required this.surname,
  });

  factory JsonEmployee.fromEmployee(Employee employee) {
    return JsonEmployee(
      id: employee.id,
      number: employee.number,
      name: employee.firstname,
      surname: employee.lastname,
    );
  }

  factory JsonEmployee.fromJson(Map<String, dynamic> json) {
    return JsonEmployee(
      id: json['id'],
      number: json['employeeNumber'],
      name: json['name'],
      surname: json['surname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeNumber': number,
      'name': name,
      'surname': surname,
    };
  }

  Employee toEmployee() {
    return Employee(
      id: id,
      number: number,
      firstname: name,
      lastname: surname,
    );
  }
}
