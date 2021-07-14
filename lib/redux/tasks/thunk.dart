import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/tasks_repository.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/redux/tasks/actions.dart';
import 'package:redux/redux.dart';

class OnCreateTask extends BaseThunkWithExtra<TasksRepository> {
  final String task;

  const OnCreateTask(this.task);

  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    store.dispatch(OnBeginLoad('Добавляем задачу'));
    await Future.delayed(Duration(seconds: 1));
    repository.addTask(task);
    store.dispatch(OnFetchTasks());
  }
}

class OnRemoveTask extends BaseThunkWithExtra<TasksRepository> {
  final Task task;

  const OnRemoveTask(this.task);

  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    store.dispatch(OnBeginLoad('Удаляем задачу'));
    await Future.delayed(Duration(seconds: 1));
    repository.removeTask(task);
    store.dispatch(OnFetchTasks());
  }
}

class OnFetchTasks extends BaseThunkWithExtra<TasksRepository> {
  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    final tasks = repository.tasks;
    store.dispatch(SetTaskAction(tasks));
    store.dispatch(OnSuccess('Список задач обновлён'));
  }
}
