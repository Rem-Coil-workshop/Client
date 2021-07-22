import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/login_screen/login_screen.dart';

import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 30),
            SizedBox(
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
                onPressed: () {
                  final store = StoreProvider.of<AppState>(context);
                  if (store.state.authState.isEntered) {
                    store.dispatch(NavigateToAction.replace(BoxesScreen.route));
                  } else {
                    store.dispatch(NavigateToAction.replace(LoginScreen.route));
                  }
                },
                child: Text('Начать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
