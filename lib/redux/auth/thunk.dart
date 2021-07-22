import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/repository/auth_repository.dart';
import 'package:slot_service_app/core/repository/local.dart';
import 'package:slot_service_app/redux/auth/action.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/login_screen/login_screen.dart';

class OnGetUsers extends BaseThunkWithExtra<AuthRepository> {
  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    final users = await repository.users;
    store.dispatch(SetUsersAction(users));
  }
}

class OnEnterInApp extends BaseThunkWithExtra<LocalRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final isEntered = await repository.isEntered;
    store.dispatch(SetEnterStatusAction(isEntered));
    if (isEntered) {
      store.dispatch(OnEnterWithUser());
    } else {
      store.dispatch(NavigateToAction.replace(LoginScreen.route));
    }
  }
}

class OnEnterWithUser extends BaseThunkWithExtra<LocalRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final user = await repository.currentUser;
    store.dispatch(SetUserAction(user));
    store.dispatch(NavigateToAction.replace(BoxesScreen.route));
  }
}

class OnExitApp extends BaseThunkWithExtra<LocalRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    await repository.logout();
    store.dispatch(SetUserAction(null));
    store.dispatch(SetEnterStatusAction(false));
    store.dispatch(NavigateToAction.replace(LoginScreen.route));
  }
}
