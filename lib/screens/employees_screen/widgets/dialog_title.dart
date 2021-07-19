import 'package:flutter/material.dart';

import '../../../constants.dart';

class DialogTitle extends StatelessWidget {
  final String _title;

  const DialogTitle({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Text(
        _title,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.start,
      ),
    );
  }
}