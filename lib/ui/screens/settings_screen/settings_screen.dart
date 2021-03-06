import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/settings_screen/widgets/network_settings.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings';
  static const privacyLevel = ADMIN_PRIVACY_LEVEL;
  static const screenNumber = 7;

  SettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: screenNumber,
      title: 'Настройки',
      currentRoute: route,
      child: BackgroundContainer(
        child: Column(
          children: [
            NetworkSettings(),
          ],
        ),
      ),
    );
  }
}
