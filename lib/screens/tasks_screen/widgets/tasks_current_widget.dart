import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/screens/tasks_screen/view_models/tasks.dart';
import 'package:slot_service_app/screens/tasks_screen/widgets/tasks_item_widget.dart';

class CurrentTasksWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, TasksViewModel>(
      onInit: (store) => store.dispatch(OnFetchTasks()),
      converter: (store) =>
          TasksViewModel.success(tasks: store.state.tasksState.tasks),
      builder: (context, vm) => vm.when(
        success: (tasks) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              tasks.isEmpty ? _buildEmptyScreen() : _buildList(tasks, store),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyScreen() {
    return Expanded(
      child: Center(child: Text('Нет элементов')),
    );
  }

  Widget _buildList(List<Task> tasks, Store<AppState> store) {
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

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        "Существующие задачи",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
