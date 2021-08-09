import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/settings_screen/widgets/network_settings.dart';
import 'package:slot_service_app/ui/widgets/login_container.dart';

class LoginNetworkScreen extends StatelessWidget {
  static const route = '/login_network';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  LoginNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return LoginContainer(
      child: Column(
        children: [
          NetworkSettings(),
          TextButton(
            onPressed: () => store.dispatch(NavigateToAction.pop()),
            child: Text('Назад'),
          ),
        ],
      ),
    );
  }
}
