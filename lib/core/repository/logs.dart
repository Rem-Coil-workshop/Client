import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:universal_html/html.dart';

class LogsRepository extends BaseRepository {
  static const BASE_URL = '/v1/logs';
  static const BASE_JOB_LOGS_URL = BASE_URL + '/job';
  static const BASE_SERVER_LOGS_URL = BASE_URL + '/main';
  static const BASE_ONE_JOB_LOG_URL = '/logs';
  static const BASE_ONE_SERVER_LOG_URL = '/server_log';
  static const CURRENT_LOG_FILE = 'Текущее состояние';

  List<String> _jobLogs = [];
  List<String> _serverLogs = [];

  Future<List<String>> get jobLogs async {
    final jsons = await _fetchFiles(BASE_JOB_LOGS_URL);
    _jobLogs = jsons.toList();
    return _jobLogs;
  }

  Future<List<String>> get serverLogs async {
    final jsons = await _fetchFiles(BASE_SERVER_LOGS_URL);
    final logs = jsons.toList()..add(CURRENT_LOG_FILE);
    _serverLogs = logs;
    return _serverLogs;
  }

  Future<void> downloadServerLog(String log) async {
    late String name;
    if (log == CURRENT_LOG_FILE) name = '';
    else name = '/$log';

    final config = await networkConfig;
    _download(
      'http://${config.host}:${config.port}$BASE_ONE_SERVER_LOG_URL$name',
      name,
    );
  }

  Future<void> downloadLog(String log) async {
    final config = await networkConfig;
    _download(
      'http://${config.host}:${config.port}$BASE_ONE_JOB_LOG_URL/$log',
      log,
    );
  }

  void _download(String url, String name) => window.open(url, name);

  Future<Iterable<String>> _fetchFiles(String url) async {
    final response = await get(url);
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

  Iterable<String> _parseBody(http.Response response) {
    final body = jsonDecode(response.body) as Iterable;
    return body.map((json) => json.toString());
  }
}
