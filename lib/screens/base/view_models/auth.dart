import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/employee.dart';

part 'auth.freezed.dart';

@freezed
class AuthViewModel with _$AuthViewModel {
  const factory AuthViewModel.success({
    required Employee employee,
  }) = Success;
}
