import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/redux/boxes/state.dart';
import 'package:slot_service_app/redux/employees/state.dart';
import 'package:slot_service_app/redux/logs/state.dart';
import 'package:slot_service_app/redux/server_logs/state.dart';
import 'package:slot_service_app/redux/status/state.dart';
import 'package:slot_service_app/redux/tasks/state.dart';
import 'package:slot_service_app/redux/user/state.dart';

part 'state.freezed.dart';

@freezed
class AppState with _$AppState {
  static const initState = AppState(
    statusState: StatusState.initState,
    authState: AuthState.initState,
    boxesState: BoxesState.initState,
    tasksState: TasksState.initState,
    employeesState: EmployeesState.initState,
    logsState: LogsState.initState,
    serverLogsState: ServerLogsState.initState,
  );

  const factory AppState({
    required StatusState statusState,
    required AuthState authState,
    required BoxesState boxesState,
    required TasksState tasksState,
    required EmployeesState employeesState,
    required LogsState logsState,
    required ServerLogsState serverLogsState,
  }) = _AppState;
}
