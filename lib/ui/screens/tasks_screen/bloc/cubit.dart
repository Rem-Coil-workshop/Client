import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/base.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/state.dart';

class TaskPermissionsCubit extends Cubit<TaskPermissionsState> {
  final TaskPermissionsRepository repository;

  TaskPermissionsCubit(Task task)
      : repository = TaskPermissionsRepository(task),
        super(TaskPermissionsState.init()) {
    onUpdateEmployees();
  }

  onUpdateEmployees() async {
    _sendNetworkRequest(
      onError: '',
      body: () async {
        await repository.fetchEmployees();
        return true;
      },
    );
  }

  onAddPermission(Employee employee) async {
    _sendNetworkRequest(
      onError: '',
      body: () async => await repository.addPermissionForEmployee(employee),
    );
  }

  onRemovePermission(Employee employee) async {
    _sendNetworkRequest(
      onError: '',
      body: () async => await repository.removePermissionForEmployee(employee),
    );
  }

  _sendNetworkRequest({
    required String onError,
    required Future<bool> Function() body,
  }) async {
    try {
      emit(TaskPermissionsState.load());
      final isCorrect = await body();
      if (isCorrect) {
        emit(TaskPermissionsState.withData(repository.employees));
      } else {
        emit(TaskPermissionsState.error(message: onError));
      }
    } catch (e) {
      emit(TaskPermissionsState.error(message: 'Ошибка подключения к сети'));
    }
  }
}

class TaskPermissionsRepository extends BaseRepository {
  final Task _task;
  final List<Employee> _employees;

  TaskPermissionsRepository(this._task) : _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    // todo - fetch employees
  }

  Future<bool> addPermissionForEmployee(Employee employee) async {
    // todo - add employee
    return true;
  }

  Future<bool> removePermissionForEmployee(Employee employee) async {
    // todo - remove employee
    return true;
  }
}
