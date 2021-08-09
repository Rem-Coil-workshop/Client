import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class LogsState with _$LogsState {
  static const initState = LogsState();

  const factory LogsState({
    @Default(<String>[]) List<String> logsFiles,
  }) = _LogsState;
}
