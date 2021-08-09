import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/user.dart';

part 'user.freezed.dart';

@freezed
class UserViewModel with _$UserViewModel {
  const factory UserViewModel.success({
    required List<User> users,
  }) = Success;
}
