import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/core/repository/boxes_repository.dart';
import 'package:slot_service_app/core/repository/tasks_repository.dart';
import 'package:slot_service_app/redux/reducer.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/screens/tasks_screen/tasks_screen.dart';

void main() {
  runApp(RemCoilDashboardApp());
}

class RemCoilDashboardApp extends StatefulWidget {
  @override
  _RemCoilDashboardAppState createState() => _RemCoilDashboardAppState();
}

class _RemCoilDashboardAppState extends State<RemCoilDashboardApp> {
  Store<AppState>? _appStateHolder;

  Store<AppState> get _appState {
    if (_appStateHolder == null) {
      final tasksRepository = TasksRepository();
      final boxesRepository = BoxesRepository();

      final taskThunkMiddleware =
          ExtraArgumentThunkMiddleware<AppState, TasksRepository>(
              tasksRepository);
      final boxThunkMiddleware =
          ExtraArgumentThunkMiddleware<AppState, BoxesRepository>(
              boxesRepository);

      _appStateHolder ??= Store<AppState>(
        appReducer,
        initialState: AppState.initState,
        middleware: [taskThunkMiddleware, boxThunkMiddleware],
      );
    }

    return _appStateHolder!;
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _appState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rem&Coil Slots Admin Panel',
        theme: ThemeData(
          canvasColor: bgColor,
          scaffoldBackgroundColor: bgColor,
          primaryColor: primaryColor,
        ),
        routes: {
          BoxesScreen.route: (context) => BoxesScreen(),
          TasksScreen.route: (context) => TasksScreen(),
          EmployeesScreen.route: (context) => EmployeesScreen(),
          LogsScreen.route: (context) => LogsScreen(),
        },
        initialRoute: TasksScreen.route,
      ),
    );
  }
}
