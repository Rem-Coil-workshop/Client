import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  static const Task nullValue = Task(id: 0, name: 'Пусто');

  const factory Task({
    required int id,
    required String name,
  }) = _Task;
}