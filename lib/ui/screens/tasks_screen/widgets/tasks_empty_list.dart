import 'package:flutter/material.dart';

class TasksEmptyList extends StatelessWidget {
  const TasksEmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Пока нет ни одной задачи'),
    );
  }
}
