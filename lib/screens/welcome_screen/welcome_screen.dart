import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/welcome_screen/widgets/navigate_button.dart';
import 'package:slot_service_app/screens/widgets/login_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginContainer(
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
    );
  }
}
