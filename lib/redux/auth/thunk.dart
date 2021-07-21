import 'package:redux/redux.dart';
import 'package:slot_service_app/core/repository/auth_repository.dart';
import 'package:slot_service_app/redux/auth/action.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/state.dart';

class OnGetUsers extends BaseThunkWithExtra<AuthRepository> {
  @override
  Future<void> execute(Store<AppState> store, AuthRepository repository) async {
    final users = await repository.users;
    store.dispatch(SetUsersAction(users));
  }
}