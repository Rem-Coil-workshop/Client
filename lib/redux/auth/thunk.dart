import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/auth_repository.dart';
import 'package:slot_service_app/core/repository/local.dart';
import 'package:slot_service_app/redux/auth/action.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/login_screen/login_screen.dart';

class OnGetUsers extends BaseThunkWithExtra<AuthRepository> {
  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    try {
      store.dispatch(OnBeginLoad(''));
      final users = await repository.users;
      store.dispatch(OnSuccess(''));
      store.dispatch(SetUsersAction(users));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch('Ошибка подключения к сети');
    }
  }
}

class OnChangeCurrentUser extends BaseThunk {
  final User? user;

  OnChangeCurrentUser(this.user);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetUserAction(user));
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
      store.dispatch(OnGetCachedUser());
    } else {
      await repository.logout();
      store.dispatch(NavigateToAction.replace(LoginScreen.route));
    }
  }
}

class OnGetCachedUser extends BaseThunkWithExtra<LocalRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final user = await repository.currentUser;
    if (user != null) {
      store.dispatch(SetUserAction(user));
      store.dispatch(NavigateToAction.replace(BoxesScreen.route));
    } else {
      store.dispatch(NavigateToAction.replace(LoginScreen.route));
    }
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

class OnUserCredentialsEnter extends BaseThunkWithExtra<AuthRepository> {
  final User user;
  final String password;

  OnUserCredentialsEnter(this.user, this.password);

  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    try {
      store.dispatch(OnBeginLoad(''));
      final token = await repository.signIn(user, password);
      store.dispatch(OnSuccess(''));
      if (token == AuthRepository.UNAUTHORIZED_STATUS) {
        store.dispatch(SetPasswordCorrectStatusAction(false));
      } else {
        store.dispatch(OnSaveUserCredentials(token));
      }
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch('Ошибка подключения к сети');
    }
  }
}

class OnSaveUserCredentials extends BaseThunkWithExtra<LocalRepository> {
  final String token;

  OnSaveUserCredentials(this.token);

  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    await repository.saveToken(token);
    store.dispatch(SetPasswordCorrectStatusAction(true));
    store.dispatch(NavigateToAction.replace(BoxesScreen.route));
  }
}
