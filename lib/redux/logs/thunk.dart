import 'package:redux/redux.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/logs.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/logs/actions.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';

class OnFetchLogs extends BaseThunkWithExtra<LogsRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LogsRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Загружаем список логов'));
      final logs = await repository.jobLogs;
      store.dispatch(OnUpdateLogs(logs));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateLogs extends BaseThunk {
  final List<String> logs;

  OnUpdateLogs(this.logs);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetLogsAction(logs));
    store.dispatch(OnSuccess('Списко логов обновлён'));
  }
}

class OnDownloadFileButtonPressed extends BaseThunkWithExtra<LogsRepository> {
  final String log;

  OnDownloadFileButtonPressed(this.log);

  @override
  Future<void> execute(Store<AppState> store, LogsRepository repository) async {
    repository.downloadLog(log);
  }
}

class OnUpdateNetworkConfigInLogsRepository
    extends BaseThunkWithExtra<LogsRepository> {
  OnUpdateNetworkConfigInLogsRepository();

  @override
  Future<void> execute(
    Store<AppState> store,
    LogsRepository repository,
  ) async {
    repository.changeNetworkClient(store.state.settingsState.network);
  }
}
