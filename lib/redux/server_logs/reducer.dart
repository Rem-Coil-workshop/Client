import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/server_logs/actions.dart';
import 'package:slot_service_app/redux/server_logs/state.dart';

final serverLogsReducer = combineReducers<ServerLogsState>([
  TypedReducer<ServerLogsState, SetServerLogsAction>(_setLogs),
]);

ServerLogsState _setLogs(ServerLogsState state, SetServerLogsAction action) =>
    state.copyWith(logsFiles: action.logs);
