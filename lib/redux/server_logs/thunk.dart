import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/logs.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/server_logs/actions.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';

class OnFetchServerLogs extends BaseThunkWithExtra<LogsRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LogsRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Загружаем список логов системы'));
      final logs = await repository.serverLogs;
      store.dispatch(OnUpdateServerLogs(logs));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateServerLogs extends BaseThunk {
  final List<String> logs;

  OnUpdateServerLogs(this.logs);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetServerLogsAction(logs));
    store.dispatch(OnSuccess('Списко логов обновлён'));
  }
}

class OnDownloadServerLog extends BaseThunkWithExtra<LogsRepository> {
  final String log;

  OnDownloadServerLog(this.log);

  @override
  Future<void> execute(
      Store<AppState> store, LogsRepository repository) async {
    repository.downloadServerLog(log);
  }
}
