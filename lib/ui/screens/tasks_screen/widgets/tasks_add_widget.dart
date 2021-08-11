import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/utils/validation.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_add_button.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_add_field.dart';

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
      this._isInputValid = isValidInput(value, (chr) {
        return AddTaskWidget.CORRECT_CODES.contains(chr);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
