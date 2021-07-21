import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/user.dart';

part 'state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  static const initState = AuthState();

  const factory AuthState({
    @Default([]) List<User> users,
    User? currentUser,
  }) = _AuthState;
}
