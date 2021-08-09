import 'package:redux_thunk/redux_thunk.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:redux/redux.dart';

abstract class BaseThunkWithExtra<T extends BaseRepository>
    implements
        CallableThunkActionWithExtraArgument<AppState, T> {
  const BaseThunkWithExtra();

  @override
  dynamic call(Store<AppState> store, T repository) =>
      execute(store, repository);

  Future<void> execute(Store<AppState> store, T repository);
}


abstract class BaseThunk implements CallableThunkAction<AppState> {
  const BaseThunk();

  @override
  dynamic call(Store<AppState> store) => execute(store);

  Future<void> execute(Store<AppState> store);
}