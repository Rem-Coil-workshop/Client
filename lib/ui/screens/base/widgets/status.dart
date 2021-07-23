import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final String message;
  final bool isLoad;
  final bool isError;

  const Status({
    Key? key,
    required this.message,
    required this.isLoad,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getStatus(),
        SizedBox(width: 15),
        Text(message),
      ],
    );
  }

  Widget getStatus() {
    if (isLoad) {
      return Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      );
    } else {
      var color = Colors.green;
      if (isError) {
        color = Colors.red;
      }
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: color),
        ),
      );
    }
  }
}