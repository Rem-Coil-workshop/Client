import 'package:redux/redux.dart';
import 'package:slot_service_app/core/repository/local.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/logs/thunk.dart';
import 'package:slot_service_app/redux/settings/actions.dart';
import 'package:slot_service_app/redux/settings/state.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';
import 'package:slot_service_app/redux/user/thunk.dart';

class OnChangeNetworkConfig extends BaseThunk {
  final String host;
  final int port;

  OnChangeNetworkConfig(this.host, this.port);

  @override
  Future<void> execute(Store<AppState> store) async {
    await store.dispatch(SetNetworkConfig(host, port));

    store.dispatch(OnLocalSaveConfig(store.state.settingsState.network));
    store.dispatch(OnUpdateNetworkConfigInBoxesRepository());
    store.dispatch(OnUpdateNetworkConfigInTasksRepository());
    store.dispatch(OnUpdateNetworkConfigInEmployeesRepository());
    store.dispatch(OnUpdateNetworkConfigInLogsRepository());
    store.dispatch(OnUpdateNetworkConfigInUserRepository());

    store.dispatch(OnSuccess('Настройки обновлены'));
  }
}

class OnLocalSaveConfig extends BaseThunkWithExtra<LocalRepository> {
  final Network config;

  OnLocalSaveConfig(this.config);

  @override
  Future<void> execute(
      Store<AppState> store, LocalRepository repository) async {
    repository.saveNetworkConfig(config);
  }
}

class OnLoadFromCacheSetting extends BaseThunkWithExtra<LocalRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final config = await repository.networkConfig;
    store.dispatch(OnChangeNetworkConfig(config.host, config.port));
  }
}
