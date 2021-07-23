import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';

class LogsScreen extends BaseMainScreen {
  static const route = '/logs';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  LogsScreen({Key? key}) : super(key: key, screenIndex: 4, title: 'Логи');

  @override
  Widget getMainWidget(BuildContext context) {
    return Center(
      child: Text('Logs Screen'),
    );
  }
}
