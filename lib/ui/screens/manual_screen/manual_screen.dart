import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/client.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';
import 'package:universal_html/html.dart';

class ManualScreen extends StatelessWidget {
  static const route = '/info';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;
  static const screenNumber = 8;

  const ManualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: screenNumber,
      title: 'Руководство по использованию',
      currentRoute: route,
      child: BackgroundContainer(
        child: Center(
          child: SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: secondaryColor),
                  ),
                ),
              ),
              onPressed: _download,
              child: Text('Открыть'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _download() async {
    final client = await HttpClient.instance();
    final url = 'http://${client.config.host}:${client.config.port}/manual';
    window.open(url, 'manual');
  }
}
