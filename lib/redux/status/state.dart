import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class StatusState with _$StatusState {
  static const initState = StatusState();

  const factory StatusState({
    @Default(null) String? message,
    @Default(false) bool isLoad,
    @Default(false) bool isError,
  }) = _StatusState;
}
