import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/auth.dart';
import 'package:slot_service_app/core/repository/local.dart';
import 'package:slot_service_app/redux/auth/action.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/ui/screens/login_screen/login_screen.dart';

class OnSingUp extends BaseThunkWithExtra<AuthRepository> {
  final User user;
  final String password;

  OnSingUp(this.user, this.password);

  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    try {
      store.dispatch(OnBeginLoad('Сохраняем пользователя'));
      await repository.signUp(user, password);
      store.dispatch(OnSuccess('Пользователь добавлен'));
      store.dispatch(OnGetUsers());
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch('Ошибка сети');
    }
  }
}

class OnGetUsers extends BaseThunkWithExtra<AuthRepository> {
  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    try {
      store.dispatch(OnBeginLoad('Загружаем список пользователей'));
      final users = await repository.users;
      store.dispatch(OnSuccess('Список пользователй обновлён'));
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
  final String nextRoute;

  OnEnterInApp(this.nextRoute);

  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final isEntered = await repository.isEntered;
    store.dispatch(SetEnterStatusAction(isEntered));
    if (isEntered) {
      store.dispatch(OnGetCachedUser(nextRoute));
    } else {
      await repository.logout();
      store.dispatch(NavigateToAction.replace(LoginScreen.route));
    }
  }
}

class OnGetCachedUser extends BaseThunkWithExtra<LocalRepository> {
  final String nextRoute;

  OnGetCachedUser(this.nextRoute);

  @override
  Future<void> execute(
    Store<AppState> store,
    LocalRepository repository,
  ) async {
    final user = await repository.currentUser;
    if (user != null) {
      store.dispatch(SetUserAction(user));
      store.dispatch(NavigateToAction.replace(nextRoute));
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
      store.dispatch(OnBeginLoad('Проверяем данные пользователя'));
      final token = await repository.signIn(user, password);
      store.dispatch(OnSuccess('Пришел ответ от сервера'));
      _validateToken(token, store);
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }

  Future<void> _validateToken(String? token, Store<AppState> store) async {
    if (token == null) {
      store.dispatch(SetPasswordCorrectStatusAction(false));
    } else {
      store.dispatch(OnSaveUserCredentials(token));
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
