import 'dart:convert';

import 'package:http/http.dart';
import 'package:slot_service_app/core/json_models/box.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/http_adapter.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class BoxesRepository extends BaseRepository {
  List<Box> _boxes = [];

  Future<List<Box>> get boxes async {
    final jsons = await _fetchBoxes();
    _boxes = jsons.map((json) => json.toBox()).toList();
    return _boxes;
  }

  Future<Iterable<JsonBox>> _fetchBoxes() async {
    final response = await HttpAdapter.get('/v1/boxes');

    if (response.statusCode == 200) {
      return _parseBody(response);
    } else {
      print(jsonDecode(response.body));
      throw NetworkException(
        message: 'Ошибка обновления данных',
        code: response.statusCode,
      );
    }
  }

  // TODO - случай добавления пустого ящика
  Future<List<Box>> changeBoxTask(Box box, Task task) async {
    if (box.taskId == task.id) return _boxes;

    final jsonBox = JsonBox.fromBox(box.copyWith(taskId: task.id));
    final response = await HttpAdapter.put('/v1/boxes', jsonBox.toJson());

    if (response.statusCode == 200) {
      final newBox = JsonBox.fromJson(jsonDecode(response.body)).toBox();
      final index = _boxes.indexWhere((box) => box.id == newBox.id);
      _boxes[index] = newBox;
      return _boxes;
    } else {
      print(jsonDecode(response.body));
      throw NetworkException(
        message: 'Данная задача уже используется в какой либо ячейке',
        code: response.statusCode,
      );
    }
  }

  Iterable<JsonBox> _parseBody(Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonBox.fromJson(json);
    });
  }
}
