import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  static const ERROR_TEXT = 'Неверный формат кода';
  static const HINT_TEXT = 'Qr код задачи';

  final TextEditingController _controller;
  final Widget _button;
  final bool _isValid;

  const AddTaskField({
    Key? key,
    required TextEditingController taskController,
    required Widget addTaskButton,
    required bool isInputValid,
  })  : _controller = taskController,
        _button = addTaskButton,
        _isValid = isInputValid,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          errorText: _isValid ? null : ERROR_TEXT,
          hintText: HINT_TEXT,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: _button,
        ),
      ),
    );
  }
}
