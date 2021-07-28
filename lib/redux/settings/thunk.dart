import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/employees/thunk.dart';
import 'package:slot_service_app/redux/logs/thunk.dart';
import 'package:slot_service_app/redux/settings/actions.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';

class OnChangeNetworkConfig extends BaseThunk {
  final String host;
  final int port;

  OnChangeNetworkConfig(this.host, this.port);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetNetworkConfig(host, port));
    store.dispatch(OnUpdateNetworkConfigInBoxesRepository());
    store.dispatch(OnUpdateNetworkConfigInEmployeesRepository());
    store.dispatch(OnUpdateNetworkConfigInTasksRepository());
    store.dispatch(OnUpdateNetworkConfigInLogsRepository());
    store.dispatch(OnSuccess('Настройки обновлены'));
  }
}