import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/logs/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/logs_screen/widgets/log_item.dart';
import 'package:slot_service_app/ui/view_models/logs.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';

class LogsScreen extends StatefulWidget {
  static const route = '/logs';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;
  static const screenNumber = 4;

  LogsScreen({Key? key});

  @override
  _LogsScreenState createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: LogsScreen.screenNumber,
      title: 'Логи',
      currentRoute: LogsScreen.route,
      child: BackgroundContainer(
        child: StoreConnector<AppState, LogsViewModel>(
          onInit: (store) => store.dispatch(OnFetchLogs()),
          converter: (store) {
            final logs = store.state.logsState.logsFiles;
            if (logs.length == 0)
              return LogsViewModel.onEmpty();
            else
              return LogsViewModel.success(logs: logs.reversed.toList());
          },
          builder: (context, vm) => vm.when(
            success: (logs) => Scrollbar(
              controller: _controller,
              child: ListView.builder(
                controller: _controller,
                itemCount: logs.length,
                itemBuilder: (context, index) => LogItem(
                  log: logs[index],
                  action: OnDownloadFileButtonPressed(logs[index]),
                ),
              ),
            ),
            onEmpty: () => Text('Пока не создано ни одного лога'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
