import 'package:flutter/material.dart';

import '../constants.dart';

class WebSocketField extends StatelessWidget {
  static const _cardValue =
      'Приложите карточку нового сотрудника к считывателю';

  final String? card;

  WebSocketField({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: _text(),
    );
  }

  _text() {
    if (card == null)
      return Text(_cardValue);
    else {
      return Text('Введенное значение карты: $card');
    }
  }
}
