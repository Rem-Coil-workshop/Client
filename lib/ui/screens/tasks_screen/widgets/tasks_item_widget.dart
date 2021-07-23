import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/task.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onPressed;

  const TaskItemWidget({Key? key, required this.task, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: Colors.grey[100]!,
          ),
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(task.name),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              splashRadius: 8,
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}