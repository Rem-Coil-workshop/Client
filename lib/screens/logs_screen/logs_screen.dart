import 'package:flutter/material.dart';
import 'package:slot_service_app/base/base_main_screen.dart';

class LogsScreen extends BaseMainScreen {
  static const String route = '/logs';

  LogsScreen({Key? key}) : super(key: key, screenIndex: 4, title: 'Логи');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Center(
      child: Text('Logs Screen'),
    );
  }
}
