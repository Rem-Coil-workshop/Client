import 'package:flutter/material.dart';

class TasksListTitle extends StatelessWidget {
  const TasksListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        "Существующие задачи",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
