import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/tasks/state.dart';

import 'actions.dart';

final tasksReducer = combineReducers<TasksState>([
  TypedReducer<TasksState, SetTasksAction>(_setTasks),
]);

TasksState _setTasks(TasksState state, SetTasksAction action) =>
    state.copyWith(tasks: action.tasks);
