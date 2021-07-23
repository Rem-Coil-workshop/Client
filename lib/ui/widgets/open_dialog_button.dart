import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/constants.dart';

class OpenDialogButton extends StatelessWidget {
  final Widget _dialog;
  final String _buttonTitle;

  const OpenDialogButton({
    Key? key,
    required Widget dialog,
    required String name,
  })  : _dialog = dialog,
        _buttonTitle = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => _dialog,
        ),
        child: Text(_buttonTitle),
      ),
    );
  }
}
