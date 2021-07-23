import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/employees_screen/bloc/card.dart';

import '../../../constants.dart';

class WebSocketField extends StatefulWidget {
  final _bloc = CardBloc();

  bool get isValid => _bloc.isValid;

  String get value => _bloc.value;

  WebSocketField({
    Key? key,
  }) : super(key: key);

  @override
  _WebSocketFieldState createState() => _WebSocketFieldState();
}

class _WebSocketFieldState extends State<WebSocketField> {
  String _cardValue = 'Приложите карточку нового сотрудника к считывателю';

  @override
  void initState() {
    super.initState();
    widget._bloc.outputStateStream.listen((vm) {
      setState(() {
        _cardValue = 'Введенное значение карты: ${vm.card}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    widget._bloc.openSocket(store.state.settingsState.network);

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Text(_cardValue),
    );
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }
}
