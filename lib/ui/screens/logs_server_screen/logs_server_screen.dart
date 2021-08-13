import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/server_logs/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/logs_screen/widgets/log_item.dart';
import 'package:slot_service_app/ui/view_models/logs.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';

class ServerLogsScreen extends StatefulWidget {
  static const route = '/server_logs';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;
  static const screenNumber = 6;

  ServerLogsScreen({Key? key});

  @override
  _ServerLogsScreenState createState() => _ServerLogsScreenState();
}

class _ServerLogsScreenState extends State<ServerLogsScreen> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: ServerLogsScreen.screenNumber,
      title: 'Логи сервера',
      currentRoute: ServerLogsScreen.route,
      child: BackgroundContainer(
        child: StoreConnector<AppState, LogsViewModel>(
          onInit: (store) => store.dispatch(OnFetchServerLogs()),
          converter: (store) {
            final logs = store.state.serverLogsState.logsFiles;
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
                  action: OnDownloadServerLog(logs[index]),
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
