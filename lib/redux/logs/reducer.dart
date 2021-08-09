import 'package:slot_service_app/redux/logs/actions.dart';
import 'package:slot_service_app/redux/logs/state.dart';
import 'package:redux/redux.dart';

final logsReducer = combineReducers<LogsState>([
  TypedReducer<LogsState, SetLogsAction>(_setLogs),
]);

LogsState _setLogs(LogsState state, SetLogsAction action) =>
    state.copyWith(logsFiles: action.logs);
