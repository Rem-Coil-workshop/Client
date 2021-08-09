import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ServerLogsState with _$ServerLogsState {
  static const initState = ServerLogsState();

  const factory ServerLogsState({
    @Default(<String>[]) List<String> logsFiles,
  }) = _ServerLogsState;
}
