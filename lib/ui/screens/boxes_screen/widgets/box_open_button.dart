import 'package:flutter/material.dart';

class BoxOpenButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BoxOpenButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: IconButton(
        onPressed: onPressed,
        hoverColor: Colors.lightBlue,
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}