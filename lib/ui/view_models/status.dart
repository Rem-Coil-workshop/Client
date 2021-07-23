import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class StatusViewModel with _$StatusViewModel {
  const factory StatusViewModel.success({
    required String message,
  }) = Success;

  const factory StatusViewModel.disable() = Disable;

  const factory StatusViewModel.loading({
    required String message,
  }) = Loading;

  const factory StatusViewModel.error({
    required String message,
  }) = Error;
}