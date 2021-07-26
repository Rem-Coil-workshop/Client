import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/core/repository/auth.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/core/repository/boxes.dart';
import 'package:slot_service_app/core/repository/employees.dart';
import 'package:slot_service_app/core/repository/local.dart';
import 'package:slot_service_app/core/repository/tasks.dart';
import 'package:slot_service_app/redux/reducer.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/navigation/route_builder.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/ui/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/ui/screens/login_screen/login_screen.dart';
import 'package:slot_service_app/ui/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/ui/screens/settings_screen/settings_screen.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/tasks_screen.dart';
import 'package:slot_service_app/ui/screens/users/users_screen.dart';
import 'package:slot_service_app/ui/screens/welcome_screen/welcome_screen.dart';

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
      final localThunkMiddleware = _getThunkMiddleware(LocalRepository());
      final taskThunkMiddleware = _getThunkMiddleware(TasksRepository());
      final boxThunkMiddleware = _getThunkMiddleware(BoxesRepository());
      final employeeThunkMiddleware =
          _getThunkMiddleware(EmployeesRepository());
      final authThunkMiddleware = _getThunkMiddleware(AuthRepository());

      _appStateHolder ??= Store<AppState>(
        appReducer,
        initialState: AppState.initState,
        middleware: [
          thunkMiddleware,
          NavigationMiddleware(),
          localThunkMiddleware,
          taskThunkMiddleware,
          boxThunkMiddleware,
          employeeThunkMiddleware,
          authThunkMiddleware,
        ],
      );
    }
    return _appStateHolder!;
  }

  ExtraArgumentThunkMiddleware _getThunkMiddleware<T extends BaseRepository>(
    T repository,
  ) {
    return ExtraArgumentThunkMiddleware<AppState, T>(repository);
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
        navigatorKey: NavigatorHolder.navigatorKey,
        onGenerateRoute: _getRoute,
      ),
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case BoxesScreen.route:
        return RouteBuilder(widget: BoxesScreen(), name: settings.name!);
      case LoginScreen.route:
        return RouteBuilder(widget: LoginScreen(), name: settings.name!);
      case TasksScreen.route:
        return RouteBuilder(widget: TasksScreen(), name: settings.name!);
      case EmployeesScreen.route:
        return RouteBuilder(widget: EmployeesScreen(), name: settings.name!);
      case LogsScreen.route:
        return RouteBuilder(widget: LogsScreen(), name: settings.name!);
      case SettingsScreen.route:
        return RouteBuilder(widget: SettingsScreen(), name: settings.name!);
      case UsersScreen.route:
        return RouteBuilder(widget: UsersScreen(), name: settings.name!);
      default:
        return RouteBuilder(widget: WelcomeScreen(), name: WelcomeScreen.route);
    }
  }
}
