import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/employee.dart';

part 'state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  static const initState = AuthState(
    employee: Employee(firstname: 'Илья', lastname: 'Родионов', number: 1976534),
  );

  const factory AuthState({
    required Employee employee,
  }) = _AuthState;
}

