import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_item_widget.dart';

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
    final store = StoreProvider.of<AppState>(context);
    final tasks = widget.tasks;

    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskItemWidget(
            task: tasks[index],
            onPressed: () {
              store.dispatch(OnRemoveTask(tasks[index]));
            },
          ),
        ),
      ),
    );
  }
}
