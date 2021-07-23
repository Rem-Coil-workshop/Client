import 'package:flutter/material.dart';

class ErrorTitle extends StatelessWidget {
  final String? _errorMessage;

  const ErrorTitle({Key? key, required errorMessage})
      : _errorMessage = errorMessage,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: TextStyle(color: Colors.red),
      );
    } else {
      return Container();
    }
  }
}
