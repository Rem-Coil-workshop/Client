import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController _controller;

  const PasswordField({Key? key, required TextEditingController controller})
      : this._controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Пароль",
        fillColor: Colors.white,
        hoverColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
