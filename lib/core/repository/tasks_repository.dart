import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class TasksRepository extends BaseRepository {
  int nextId = 4;
  final List<Task> _tasks = [
    Task(id: 1, name: '12-1/12'),
    Task(id: 2, name: '12-2/12'),
    Task(id: 3, name: '12-3/12'),
    Task(id: 4, name: '12-4/12'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String taskName) {
    Task task = Task(id: nextId, name: taskName);
    _tasks.add(task);
    nextId++;
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }
}
