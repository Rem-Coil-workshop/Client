import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/base/base_main_screen.dart';
import 'package:slot_service_app/screens/settings_screen/widgets/network_settings.dart';

import '../../constants.dart';

class SettingsScreen extends BaseMainScreen {
  static const String route = '/settings';

  SettingsScreen({Key? key})
      : super(key: key, screenIndex: 5, title: 'Настройки');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2 * defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          NetworkSettings(),
        ],
      ),
    );
  }
}
