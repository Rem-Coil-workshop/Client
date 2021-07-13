import 'package:flutter/material.dart';

class BoxNumberWidget extends StatelessWidget {
  const BoxNumberWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        number.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
