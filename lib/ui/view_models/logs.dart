import 'package:freezed_annotation/freezed_annotation.dart';

part 'logs.freezed.dart';

@freezed
class LogsViewModel with _$LogsViewModel {
  const factory LogsViewModel.success({
    required List<String> logs,
  }) = Success;

  const factory LogsViewModel.onEmpty() = OnEmpty;
}
