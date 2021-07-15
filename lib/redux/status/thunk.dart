import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

class OnBeginLoad extends BaseThunk {
  final String message;

  const OnBeginLoad(this.message);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetMessageAction(message));
    store.dispatch(SetLoadStatusAction(true));
  }
}

class OnSuccess extends BaseThunk {
  final String message;

  const OnSuccess(this.message);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetMessageAction(message));
    store.dispatch(SetLoadStatusAction(false));
    store.dispatch(SetErrorStatusAction(false));
  }
}

class OnError extends BaseThunk {
  final String message;

  const OnError(this.message);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetMessageAction(message));
    store.dispatch(SetLoadStatusAction(false));
    store.dispatch(SetErrorStatusAction(true));
  }
}