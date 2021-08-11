import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/ui/widgets/end_line.dart';
import 'package:slot_service_app/ui/widgets/icon_buttons.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final dynamic action;

  const TaskItemWidget({Key? key, required this.task, required this.action})
      : super(key: key);

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
            EndLineRow(
              isInRow: true,
              widgets: [
                ListIconButton(
                  onPressed: () {},
                  icon: Icons.settings,
                  color: Colors.blue,
                ),
                RemoveIconButton(action: action),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
