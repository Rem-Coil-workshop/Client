import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/user.dart';

part 'login_view_model.freezed.dart';

@freezed
class LoginViewModel with _$LoginViewModel {
  const factory LoginViewModel.load() = Load;

  const factory LoginViewModel.success({
    required List<User> users,
    required User? currentUser,
  }) = Success;

  const factory LoginViewModel.error({required BuildContext context}) = Error;
}
