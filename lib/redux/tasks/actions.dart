import 'package:slot_service_app/core/models/task.dart';

class SetTasksAction {
  final List<Task> tasks;

  const SetTasksAction(this.tasks);
}