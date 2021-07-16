import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';

import '../../../constants.dart';

class AddTaskWidget extends StatefulWidget {
  static const CORRECT_CODES = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    '-',
    '/'
  ];

  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _controller = TextEditingController();
  var _isInputValid = true;

  bool _validateQrCode(String qrCode) {
    for (var rune in qrCode.runes) {
      var character = String.fromCharCode(rune);
      if (!AddTaskWidget.CORRECT_CODES.contains(character)) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'Создать новую задачу: ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 15,
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() {
                this._isInputValid = _validateQrCode(value);
              }),
              decoration: InputDecoration(
                errorText: _isInputValid ? null : 'Неверный формат кода',
                hintText: "Qr код задачи",
                fillColor: Colors.white,
                hoverColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    store.dispatch(OnCreateTask(_controller.text));
                    _controller.clear();
                  },
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding * 0.5),
                    margin:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
