import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/employee.dart';

part 'state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  static const initState = AuthState(
    employee: Employee(firstname: 'Дмитрий', lastname: 'Жарков'),
  );

  const factory AuthState({
    required Employee employee,
  }) = _AuthState;
}

