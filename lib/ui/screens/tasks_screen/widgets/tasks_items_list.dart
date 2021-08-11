import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/permissions_dialog.dart';
import 'package:slot_service_app/ui/widgets/end_line.dart';
import 'package:slot_service_app/ui/widgets/icon_buttons.dart';

class TasksItemsList extends StatefulWidget {
  final List<Task> tasks;

  const TasksItemsList({Key? key, required this.tasks}) : super(key: key);

  @override
  _TasksItemsListState createState() => _TasksItemsListState();
}

class _TasksItemsListState extends State<TasksItemsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final tasks = widget.tasks;

    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskItemWidget(
            task: tasks[index],
            action: OnRemoveTask(tasks[index]),
          ),
        ),
      ),
    );
  }
}

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
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => PermissionsDialog(task: task),
                  ),
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