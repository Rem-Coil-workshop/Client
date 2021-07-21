import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/user.dart';

part 'login_view_model.freezed.dart';

@freezed
class LoginViewModel with _$LoginViewModel {
  const factory LoginViewModel.withUsers({
    required List<User> users,
  }) = WithUsers;

  const factory LoginViewModel.load() = Load;
}
