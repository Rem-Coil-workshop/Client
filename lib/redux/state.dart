import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/redux/boxes/state.dart';
import 'package:slot_service_app/redux/employees/state.dart';
import 'package:slot_service_app/redux/logs/state.dart';
import 'package:slot_service_app/redux/server_logs/state.dart';
import 'package:slot_service_app/redux/settings/state.dart';
import 'package:slot_service_app/redux/status/state.dart';
import 'package:slot_service_app/redux/tasks/state.dart';
import 'package:slot_service_app/redux/user/state.dart';

part 'state.freezed.dart';

@freezed
class AppState with _$AppState {
  static const initState = AppState(
    authState: AuthState.initState,
    statusState: StatusState.initState,
    boxesState: BoxesState.initState,
    tasksState: TasksState.initState,
    logsState: LogsState.initState,
    serverLogsState: ServerLogsState.initState,
    employeesState: EmployeesState.initState,
    settingsState: SettingsState.initState,
  );

  const factory AppState({
    required BoxesState boxesState,
    required TasksState tasksState,
    required LogsState logsState,
    required ServerLogsState serverLogsState,
    required AuthState authState,
    required StatusState statusState,
    required EmployeesState employeesState,
    required SettingsState settingsState,
  }) = _AppState;
}
