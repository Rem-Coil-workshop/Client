import 'dart:convert';

import 'package:http/http.dart';
import 'package:slot_service_app/core/json_models/task.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/http_adapter.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class TasksRepository extends BaseRepository {
  late List<Task> _tasks;

  Future<List<Task>> fetchTasks() async {
    final jsons = await _fetchTasks();
    _tasks = jsons.map((json) => json.toTask()).toList();
    return _tasks;
  }

  Future<List<Task>> addTask(String taskName) async {
    final Response response = await HttpAdapter.post(
      '/v1/tasks',
      {'qrCode': taskName},
    );

    if (response.statusCode == 200) {
      final responseBody =
          JsonTask.fromJson(jsonDecode(response.body)).toTask();
      _tasks.add(responseBody);
      return _tasks;
    } else {
      print(jsonDecode(response.body));
      throw NetworkException(
        message: 'Данная задача уже существует',
        code: response.statusCode,
      );
    }
  }

  Future<List<Task>> removeTask(Task task) async {
    final Response response = await HttpAdapter.delete('/v1/tasks/${task.id}');

    if (response.statusCode == 200) {
      _tasks.remove(task);
      return _tasks;
    } else {
      print(jsonDecode(response.body));
      throw NetworkException(
        message: 'Данная задача находится в ячейке',
        code: response.statusCode,
      );
    }
  }

  Future<List<JsonTask>> _fetchTasks() async {
    final Response response = await HttpAdapter.get('/v1/tasks');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body) as List;
      return responseBody.map((element) {
        return JsonTask.fromJson(element);
      }).toList();
    } else {
      print(jsonDecode(response.body));
      throw NetworkException(
        message: 'Ошибка обновления данных',
        code: response.statusCode,
      );
    }
  }
}
