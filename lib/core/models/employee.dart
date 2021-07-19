import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String firstname,
    required String lastname,
    required int number,
  }) = _Employee;
}
