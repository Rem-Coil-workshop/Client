import 'package:flutter/material.dart';
import 'package:slot_service_app/screens/tasks_screen/models/task.dart';

class BoxSelectTaskWidget extends StatelessWidget {
  final List<Task> _tasks;
  final ValueChanged<String?> _onChanged;
  final String _currentTask;

  const BoxSelectTaskWidget({
    Key? key,
    required List<Task> tasks,
    required ValueChanged<String?> onChanged,
    required String currentTask,
  })  : _tasks = tasks,
        _onChanged = onChanged,
        _currentTask = currentTask,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentTask,
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      onChanged: _onChanged,
      items: _tasks.map<DropdownMenuItem<String>>((Task task) {
        return DropdownMenuItem<String>(
          value: task.name,
          child: Text(task.name),
        );
      }).toList(),
    );
  }
}