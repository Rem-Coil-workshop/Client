import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/task.dart';

class SelectTaskButton extends StatelessWidget {
  final List<Task> _tasks;
  final ValueChanged<Task?> _onChanged;
  final Task _currentTask;

  const SelectTaskButton({
    Key? key,
    required List<Task> tasks,
    required ValueChanged<Task?> onChanged,
    required Task currentTask,
  })  : _tasks = tasks,
        _onChanged = onChanged,
        _currentTask = currentTask,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Task>(
      value: _currentTask,
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      onChanged: _onChanged,
      items: _tasks.map<DropdownMenuItem<Task>>((Task task) {
        return DropdownMenuItem<Task>(
          value: task,
          child: Text(task.name),
        );
      }).toList(),
    );
  }
}