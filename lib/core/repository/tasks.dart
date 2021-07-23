import 'dart:convert';

import 'package:slot_service_app/core/json_models/task.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class TasksRepository extends BaseRepository {
  static const BASE_URL = '/v1/tasks';
  late List<Task> _tasks;

  Future<List<Task>> fetchTasks() async {
    final jsons = await _fetchTasks();
    _tasks = jsons.map((json) => json.toTask()).toList();
    return _tasks;
  }

  Future<List<Task>> addTask(String taskName) async {
    final response = await client.post(
      BASE_URL,
      {'qrCode': taskName},
    );

    if (response.statusCode == HttpStatus.ok) {
      final taskJson = JsonTask.fromJson(jsonDecode(response.body));
      _tasks.add(taskJson.toTask());
      return _tasks;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Данная задача уже существует',
      );
    }
  }

  Future<List<Task>> removeTask(Task task) async {
    final response = await client.delete('$BASE_URL/${task.id}');

    if (response.statusCode == HttpStatus.ok) {
      _tasks.remove(task);
      return _tasks;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Данная задача находится в ячейке',
      );
    }
  }

  Future<List<JsonTask>> _fetchTasks() async {
    final response = await client.get(BASE_URL);

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = jsonDecode(response.body) as List;
      return responseBody.map((element) {
        return JsonTask.fromJson(element);
      }).toList();
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка обновления данных',
      );
    }
  }
}
