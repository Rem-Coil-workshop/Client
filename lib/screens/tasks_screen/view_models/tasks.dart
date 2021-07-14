import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/task.dart';

part 'tasks.freezed.dart';

@freezed
class TasksViewModel with _$TasksViewModel {
  const factory TasksViewModel.success({
    required List<Task> tasks,
  }) = Success;
}