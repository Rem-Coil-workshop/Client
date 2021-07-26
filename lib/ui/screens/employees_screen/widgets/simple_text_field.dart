import 'package:flutter/material.dart';
import 'package:slot_service_app/core/utils/validation.dart';

import '../../../constants.dart';

class SimpleTextField extends StatefulWidget {
  final String _hintText;
  final String _errorText;
  final TextEditingController _controller = TextEditingController();
  final bool Function(String) isValidCharacter;
  final bool isObscureText;

  String get value => _controller.text;

  bool get isValid => isValidInput(_controller.text, isValidCharacter);

  SimpleTextField({
    Key? key,
    required String hintText,
    required String errorText,
    required this.isValidCharacter,
    this.isObscureText = false,
  })  : _hintText = hintText,
        _errorText = errorText,
        super(key: key);

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  var isValidValue = true;

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() {
      setState(() {
        this.isValidValue =
            isValidInput(widget._controller.text, widget.isValidCharacter);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: TextField(
        controller: widget._controller,
        obscureText: widget.isObscureText,
        decoration: InputDecoration(
          errorText: isValidValue
              ? null
              : 'Неверный формат введенныйх данных. ${widget._errorText}',
          hintText: widget._hintText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }
}
