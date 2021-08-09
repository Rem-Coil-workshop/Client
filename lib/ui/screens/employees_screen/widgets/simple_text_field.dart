import 'package:flutter/material.dart';

import '../../../constants.dart';

class SimpleTextField extends StatelessWidget {
  final String _hintText;
  final String _errorText;
  final bool _isValid;
  final TextEditingController _controller;
  final bool isObscureText;

  SimpleTextField({
    Key? key,
    required TextEditingController controller,
    required bool isValid,
    required String hintText,
    required String errorText,
    this.isObscureText = false,
  })  : _controller = controller,
        _isValid = isValid,
        _hintText = hintText,
        _errorText = errorText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: TextField(
        controller: _controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          errorText: _isValid
              ? null
              : 'Неверный формат введенныйх данных. $_errorText',
          hintText: _hintText,
        ),
      ),
    );
  }
}
