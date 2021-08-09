import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/settings/actions.dart';
import 'package:slot_service_app/redux/settings/state.dart';

final settingsReducer = combineReducers<SettingsState>([
  TypedReducer<SettingsState, SetNetworkConfig>(_setNetwork),
]);

SettingsState _setNetwork(SettingsState state, SetNetworkConfig action) =>
    state.copyWith(network: Network(host: action.host, port: action.port));
