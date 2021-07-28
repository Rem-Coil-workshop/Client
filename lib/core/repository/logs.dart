import 'dart:convert';

import 'package:http/http.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class LogsRepository extends BaseRepository {
  static const BASE_URL = '/v1/logs';
  static const BASE_LOG_URL = '/logs';
  List<String> _files = [];

  Future<List<String>> get files async {
    final jsons = await _fetchFiles();
    _files = jsons.toList();
    return _files;
  }

  void downloadLog(String log) {
    final url =
        'http://${client.config.host}:${client.config.port}$BASE_LOG_URL/$log';
    window.open(url, log);
  }

  Future<Iterable<String>> _fetchFiles() async {
    final response = await client.get(BASE_URL);
    if (response.statusCode == HttpStatus.ok) {
      return _parseBody(response);
    } else {
      print(response.body);
      throw NetworkException.fromResponse(
        response: response,
        message: 'Ошибка загрузки списка файлов',
      );
    }
  }

  Iterable<String> _parseBody(Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) => json.toString());
  }
}
