import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/json_models/box.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class BoxesRepository extends BaseRepository {
  static const BASE_URL = '/v1/boxes';
  List<Box> _boxes = [];

  Future<List<Box>> get boxes async {
    final jsons = await _fetchBoxes();
    _boxes = jsons.map((json) => json.toBox()).toList();
    return _boxes;
  }

  Future<Iterable<JsonBox>> _fetchBoxes() async {
    final response = await get(BASE_URL);

    if (response.statusCode == HttpStatus.ok) {
      return _parseBody(response);
    } else {
      print(jsonDecode(response.body));
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка обновления данных',
      );
    }
  }

  Future<List<Box>> changeBoxTask(Box box, Task task) async {
    if (box.taskId == task.id) return _boxes;

    final jsonBox = JsonBox.fromBox(box.copyWith(taskId: task.id));
    final response = await put(BASE_URL, jsonBox.toJson());

    if (response.statusCode == HttpStatus.ok) {
      final newBox = JsonBox.fromJson(jsonDecode(response.body)).toBox();
      final index = _boxes.indexWhere((box) => box.id == newBox.id);
      _boxes[index] = newBox;
      return _boxes;
    } else {
      throw NetworkException.fromResponse(
        response: response,
        message: 'Данная задача уже используется в какой либо ячейке',
      );
    }
  }

  Iterable<JsonBox> _parseBody(http.Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) {
      return JsonBox.fromJson(json);
    });
  }
}
