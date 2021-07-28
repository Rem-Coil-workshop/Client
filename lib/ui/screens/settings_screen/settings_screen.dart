import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/settings_screen/widgets/network_settings.dart';

import '../../constants.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;

  SettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: 5,
      title: 'Настройки',
      currentRoute: route,
      child: Container(
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
      ),
    );
  }
}
