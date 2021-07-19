import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/task.dart';

part 'state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  static const initState = TasksState();

  const factory TasksState({
    @Default(<Task>[]) List<Task> tasks,
  }) = _TasksState;
}
