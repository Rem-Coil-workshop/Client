import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/employees_repository.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/employees/actions.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';

class OnCreateEmployee extends BaseThunkWithExtra<EmployeesRepository> {
  final Employee employee;

  OnCreateEmployee(this.employee);

  @override
  Future<void> execute(
    Store<AppState> store,
    EmployeesRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Создаём нового сотрудника'));
      final employees = await repository.addEmployee(employee);
      store.dispatch(OnUpdateEmployees(employees));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnDeleteEmployee extends BaseThunkWithExtra<EmployeesRepository> {
  final Employee employee;

  OnDeleteEmployee(this.employee);

  @override
  Future<void> execute(
    Store<AppState> store,
    EmployeesRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Удаляем сотрудника'));
      final employees = await repository.deleteEmployee(employee);
      store.dispatch(OnUpdateEmployees(employees));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnFetchEmployees extends BaseThunkWithExtra<EmployeesRepository> {
  @override
  Future<void> execute(Store<AppState> store, repository) async {
    try {
      store.dispatch(OnBeginLoad('Загружаем список сотрудников'));
      final employees = await repository.employees;
      store.dispatch(OnUpdateEmployees(employees));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateEmployees extends BaseThunk {
  final List<Employee> employees;

  OnUpdateEmployees(this.employees);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetEmployeesAction(employees));
    store.dispatch(OnSuccess('Список сотрудников обновлён'));
  }
}

class OnUpdateNetworkConfigInEmployeesRepository
    extends BaseThunkWithExtra<EmployeesRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    EmployeesRepository repository,
  ) async {
    repository.changeNetworkClient(store.state.settingsState.network);
  }
}
