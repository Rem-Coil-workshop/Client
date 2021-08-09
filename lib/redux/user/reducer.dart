import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/user/state.dart';

import 'action.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SetUsersAction>(_setUsers),
  TypedReducer<AuthState, SetUserAction>(_setUser),
  TypedReducer<AuthState, SetPasswordCorrectStatusAction>(_setPassword),
  TypedReducer<AuthState, SetEnterStatusAction>(_setEnterStatus)
]);

AuthState _setUsers(AuthState state, SetUsersAction action) =>
    state.copyWith(users: action.users);

AuthState _setUser(AuthState state, SetUserAction action) =>
    state.copyWith(currentUser: action.user);

AuthState _setEnterStatus(AuthState state, SetEnterStatusAction action) =>
    state.copyWith(isEntered: action.isEntered);

AuthState _setPassword(AuthState state, SetPasswordCorrectStatusAction action) =>
    state.copyWith(isPasswordCorrect: action.isCorrect);
