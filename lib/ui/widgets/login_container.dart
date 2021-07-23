import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/constants.dart';

class LoginContainer extends StatelessWidget {
  final Widget child;

  const LoginContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(2 * defaultPadding),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
