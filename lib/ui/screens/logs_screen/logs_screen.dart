import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/logs/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/view_models/logs.dart';

class LogsScreen extends StatefulWidget {
  static const route = '/logs';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  LogsScreen({Key? key});

  @override
  _LogsScreenState createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: 4,
      title: 'Логи',
      currentRoute: LogsScreen.route,
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: StoreConnector<AppState, LogsViewModel>(
          onInit: (store) => store.dispatch(OnFetchLogs()),
          converter: (store) {
            final statusState = store.state.statusState;
            if (statusState.isError) return LogsViewModel.onError();

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
                itemBuilder: (context, index) => LogItem(log: logs[index]),
              ),
            ),
            onError: () => Center(
              child: Text('Произошла ошибка при загрузке данных.'),
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

class LogItem extends StatelessWidget {
  final String log;

  const LogItem({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      mouseCursor: SystemMouseCursors.basic,
      title: Row(
        children: [
          Text(
            log,
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: secondaryColor),
                ),
              ),
            ),
            onPressed: () {
              final store = StoreProvider.of<AppState>(context);
              store.dispatch(OnDownloadFileButtonPressed(log));
            },
            child: Container(
              width: 200,
              height: 40,
              child: Center(
                child: Text(
                  'Скачать',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
