import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/tasks.dart';
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
    try {
      final tasks = await repository.addTask(task);
      store.dispatch(OnUpdateTasks(tasks));
    } on NetworkException catch (e) {
      store.dispatch(OnTasksNetworkError(e.message));
    } catch (e) {
      store.dispatch(OnTasksNetworkError('Ошибка подключения к сети'));
    }
  }
}

class OnRemoveTask extends BaseThunkWithExtra<TasksRepository> {
  final Task task;

  const OnRemoveTask(this.task);

  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    store.dispatch(OnBeginLoad('Удаляем задачу'));
    try {
      final tasks = await repository.removeTask(task);
      store.dispatch(OnUpdateTasks(tasks));
    } on NetworkException catch (e) {
      store.dispatch(OnTasksNetworkError(e.message));
    } catch (e) {
      store.dispatch(OnTasksNetworkError('Ошибка подключения к сети'));
    }
  }
}

class OnFetchTasks extends BaseThunkWithExtra<TasksRepository> {
  @override
  Future<void> execute(
      Store<AppState> store, TasksRepository repository) async {
    store.dispatch(OnBeginLoad('Загружаем задачи'));
    try {
      final tasks = await repository.fetchTasks();
      store.dispatch(OnUpdateTasks(tasks));
    } on NetworkException catch (e) {
      store.dispatch(OnTasksNetworkError(e.message));
    } catch (e) {
      store.dispatch(OnTasksNetworkError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateTasks extends BaseThunk {
  final List<Task> tasks;

  OnUpdateTasks(this.tasks);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetTasksAction(tasks));
    store.dispatch(OnSuccess('Список задач обновлён'));
  }
}

class OnTasksNetworkError extends BaseThunk {
  final String message;

  OnTasksNetworkError(this.message);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(OnError(message));
  }
}
