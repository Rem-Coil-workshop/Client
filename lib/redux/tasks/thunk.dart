import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/tasks_repository.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/actions.dart';
import 'package:redux/redux.dart';

class OnCreateTask extends BaseThunk<TasksRepository> {
  final String task;

  const OnCreateTask(this.task);

  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    store.dispatch(SetTaskAction([]));
    repository.addTask(task);
    store.dispatch(OnFetchTasks());
  }
}

class OnRemoveTask extends BaseThunk<TasksRepository> {
  final Task task;

  const OnRemoveTask(this.task);

  @override
  Future<void> execute(Store<AppState> store, TasksRepository repository) async {
    store.dispatch(SetTaskAction([]));
    repository.removeTask(task);
    store.dispatch(OnFetchTasks());
  }
}

class OnFetchTasks extends BaseThunk<TasksRepository> {
  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    final tasks = repository.tasks;
    store.dispatch(SetTaskAction(tasks));
  }
}
