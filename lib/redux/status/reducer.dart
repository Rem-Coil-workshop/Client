import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/status/state.dart';

import 'actions.dart';

final statusReducer = combineReducers<StatusState>([
  TypedReducer<StatusState, SetLoadStatusAction>(_setLoad),
  TypedReducer<StatusState, SetMessageAction>(_setMessage),
  TypedReducer<StatusState, SetErrorStatusAction>(_setError),
  TypedReducer<StatusState, DisableStatusAction>(_disableStatus),
]);

StatusState _setMessage(StatusState state, SetMessageAction action) =>
    state.copyWith(message: action.message);

StatusState _disableStatus(StatusState state, DisableStatusAction action) =>
    StatusState.initState;

StatusState _setLoad(StatusState state, SetLoadStatusAction action) =>
    state.copyWith(isLoad: action.isLoad);

StatusState _setError(StatusState state, SetErrorStatusAction action) =>
    state.copyWith(isError: action.isError);

