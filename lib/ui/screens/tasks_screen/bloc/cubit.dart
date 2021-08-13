import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_service_app/core/models/employee.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/permission.dart';
import 'package:slot_service_app/ui/screens/tasks_screen/bloc/state.dart';

class TaskPermissionsCubit extends Cubit<TaskPermissionsState> {
  final TaskPermissionsRepository repository;

  TaskPermissionsCubit(Task task)
      : repository = TaskPermissionsRepository(task),
        super(TaskPermissionsState.init()) {
    onUpdateEmployees();
  }

  onUpdateEmployees() async {
    try {
      emit(TaskPermissionsState.load());
      final isCorrect = await repository.fetchEmployees();
      if (isCorrect) {
        emit(TaskPermissionsState.withData(repository.employees));
      } else {
        emit(TaskPermissionsState.error(message: 'Ошибка загрзуки данных'));
      }
    } catch (e) {
      emit(TaskPermissionsState.error(message: 'Ошибка подключения к сети'));
    }
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
      final isCorrect = await body();
      if (isCorrect) {
        emit(TaskPermissionsState.withData(repository.employees));
      } else {
        emit(state.addError(onError));
      }
    } catch (e) {
      emit(state.addError('Ошибка подключения к сети'));
    }
  }
}
