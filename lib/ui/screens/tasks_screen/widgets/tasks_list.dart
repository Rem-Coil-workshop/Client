import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_empty_list.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_items_list.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/widgets/tasks_list_title.dart';
import 'package:slot_service_app/ui/view_models/tasks.dart';
import 'package:slot_service_app/ui/widgets/BackgroundContainer.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TasksViewModel>(
      onInit: (store) => store.dispatch(OnFetchTasks()),
      converter: (store) {
        final tasks = store.state.tasksState.tasks;
        if (tasks.isEmpty) {
          return TasksViewModel.empty();
        } else {
          return TasksViewModel.success(tasks: tasks);
        }
      },
      builder: (context, vm) => vm.when(
        success: (tasks) => BackgroundContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TasksListTitle(),
              TasksItemsList(tasks: tasks),
            ],
          ),
        ),
        empty: () => TasksEmptyList(),
      ),
    );
  }
}
