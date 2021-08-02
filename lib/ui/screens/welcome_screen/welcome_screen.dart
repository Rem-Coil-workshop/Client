import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/settings/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/welcome_screen/widgets/welcome_navigate_button.dart';
import 'package:slot_service_app/ui/widgets/login_container.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      onInit: (store) => store.dispatch(OnLoadFromCacheSetting()),
      converter: (store) => "",
      builder: (context, vm) => LoginContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/images/logo.png')),
              SizedBox(height: 30),
              NavigateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
