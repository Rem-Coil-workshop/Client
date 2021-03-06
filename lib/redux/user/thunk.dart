import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/user.dart';
import 'package:slot_service_app/core/repository/token.dart';
import 'package:slot_service_app/main.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/ui/screens/login_screen/login_screen.dart';

import 'action.dart';

class OnUserCreated extends BaseThunkWithExtra<UserRepository> {
  final User user;
  final String password;

  OnUserCreated(this.user, this.password);

  @override
  Future<void> execute(Store<AppState> store, UserRepository repository) async {
    try {
      store.dispatch(OnBeginLoad('Сохраняем пользователя'));
      await repository.saveUser(user, password);
      store.dispatch(OnSuccess('Пользователь добавлен'));
      store.dispatch(OnGetUsers());
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка сети'));
    }
  }
}

class OnGetUsers extends BaseThunkWithExtra<UserRepository> {
  @override
  Future<void> execute(Store<AppState> store, UserRepository repository) async {
    try {
      await store.dispatch(OnBeginLoad('Загружаем список пользователей'));
      final users = await repository.users;
      store.dispatch(OnUpdateUsers(users));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateUsers extends BaseThunk {
  final List<User> users;

  OnUpdateUsers(this.users);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(OnSuccess('Список пользователй обновлён'));
    store.dispatch(SetUsersAction(users));
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

class OnEnterInApp extends BaseThunk {
  final String nextRoute;

  OnEnterInApp(this.nextRoute);

  @override
  Future<void> execute(
    Store<AppState> store,
  ) async {
    final repository = TokenRepository.instance();
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

class OnGetCachedUser extends BaseThunk {
  final String nextRoute;

  OnGetCachedUser(this.nextRoute);

  @override
  Future<void> execute(
    Store<AppState> store,
  ) async {
    final user = await TokenRepository.instance().currentUser;
    if (user != null) {
      store.dispatch(SetUserAction(user));
      store.dispatch(NavigateToAction.replace(nextRoute));
    } else {
      store.dispatch(NavigateToAction.replace(LoginScreen.route));
    }
  }
}

class OnExitApp extends BaseThunk {
  @override
  Future<void> execute(
    Store<AppState> store,
  ) async {
    await TokenRepository.instance().logout();
    store.dispatch(SetUserAction(null));
    store.dispatch(SetEnterStatusAction(false));
    store.dispatch(NavigateToAction.replace(LoginScreen.route));
  }
}

class OnUserCredentialsEnter extends BaseThunkWithExtra<UserRepository> {
  final User user;
  final String password;

  OnUserCredentialsEnter(this.user, this.password);

  @override
  Future<void> execute(Store<AppState> store, UserRepository repository) async {
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

class OnSaveUserCredentials extends BaseThunk {
  final String token;

  OnSaveUserCredentials(this.token);

  @override
  Future<void> execute(
    Store<AppState> store,
  ) async {
    await TokenRepository.instance().saveToken(token);
    store.dispatch(SetPasswordCorrectStatusAction(true));
    store.dispatch(NavigateToAction.replace(RemCoilDashboardApp.MAIN_ROUTE));
  }
}

class OnDeleteUser extends BaseThunkWithExtra<UserRepository> {
  final User user;

  OnDeleteUser(this.user);

  @override
  Future<void> execute(
    Store<AppState> store,
    UserRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Удаляем пользователя'));
      if (store.state.authState.currentUser == user) {
        store.dispatch(OnError('Вы удаляете текущего пользователя'));
      } else {
        final users = await repository.deleteUser(user);
        store.dispatch(OnUpdateUsers(users));
      }
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}
