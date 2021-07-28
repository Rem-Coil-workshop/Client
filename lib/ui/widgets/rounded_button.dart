import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/constants.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double radius;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: secondaryColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
