import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  static const initState = SettingsState(
    network: Network.initState,
  );

  const factory SettingsState({
    required Network network,
  }) = _SettingsState;
}

@freezed
class Network with _$Network {
  static const initState = Network();

  const factory Network({
    @Default('localhost') String host,
    // @Default('10.0.0.116') String host,
    @Default(80) int port,
  }) = _Network;
}