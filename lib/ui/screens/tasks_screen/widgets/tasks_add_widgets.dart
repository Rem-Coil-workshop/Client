import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/ui/constants.dart';

class AddTaskRow extends StatefulWidget {
  @override
  _AddTaskRowState createState() => _AddTaskRowState();
}

class _AddTaskRowState extends State<AddTaskRow> {
  final _controller = TextEditingController();
  var _isInputValid = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onInput);
  }

  @override
  Widget build(BuildContext context) {
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
          AddTaskField(
            taskController: _controller,
            addTaskButton: AddTaskButton(onTap: _validateInput),
            isInputValid: _isInputValid,
          ),
        ],
      ),
    );
  }

  void _validateInput(Store<AppState> store) {
    if (_controller.text.isNotEmpty && _isInputValid) {
      store.dispatch(OnCreateTask(_controller.text));
      _controller.clear();
    } else {
      setState(() {
        _isInputValid = false;
      });
    }
  }

  void _onInput() {
    setState(() {
      final value = _controller.text;
      this._isInputValid = isValidQrCode(value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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

class AddTaskButton extends StatelessWidget {
  final Function(Store<AppState>) _onTap;

  const AddTaskButton({
    Key? key,
    required Function(Store<AppState>) onTap,
  })  : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return InkWell(
      onTap: () => _onTap(store),
      child: Container(
        padding: EdgeInsets.all(defaultPadding * 0.5),
        margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}