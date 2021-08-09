import 'package:slot_service_app/redux/logs/reducer.dart';
import 'package:slot_service_app/redux/server_logs/reducer.dart';
import 'package:slot_service_app/redux/settings/reducer.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/reducer.dart';
import 'package:slot_service_app/redux/user/reducer.dart';

import 'boxes/reducer.dart';
import 'employees/reducer.dart';
import 'tasks/reducer.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      authState: authReducer(state.authState, action),
      tasksState: tasksReducer(state.tasksState, action),
      boxesState: boxesReducer(state.boxesState, action),
      statusState: statusReducer(state.statusState, action),
      employeesState: employeesReducer(state.employeesState, action),
      settingsState: settingsReducer(state.settingsState, action),
      logsState: logsReducer(state.logsState, action),
      serverLogsState: serverLogsReducer(state.serverLogsState, action),
    );
