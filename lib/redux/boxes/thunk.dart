import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/network/client.dart';
import 'package:slot_service_app/core/network/network_exception.dart';
import 'package:slot_service_app/core/repository/boxes.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/boxes/actions.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/status/thunk.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';

class OnTaskChange extends BaseThunkWithExtra<BoxesRepository> {
  final Box box;
  final Task task;

  OnTaskChange({required this.box, required this.task});

  @override
  Future<void> execute(
    Store<AppState> store,
    BoxesRepository repository,
  ) async {
    store.dispatch(OnBeginLoad('Изменяем значение задачи'));
    try {
      final boxes = await repository.changeBoxTask(box, task);
      store.dispatch(OnUpdateBoxes(boxes));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnFetchBoxes extends BaseThunkWithExtra<BoxesRepository> {
  @override
  Future<void> execute(
    Store<AppState> store,
    BoxesRepository repository,
  ) async {
    try {
      store.dispatch(OnBeginLoad('Загружаем доступные ячейки'));
      store.dispatch(OnFetchTasks());
      final boxes = await repository.boxes;
      store.dispatch(OnUpdateBoxes(boxes));
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}

class OnUpdateBoxes extends BaseThunk {
  final List<Box> boxes;

  OnUpdateBoxes(this.boxes);

  @override
  Future<void> execute(Store<AppState> store) async {
    store.dispatch(SetBoxesAction(boxes));
    store.dispatch(OnSuccess('Список ячеек обновлён'));
  }
}

class OnOpenBox extends BaseThunk {
  final Box box;

  OnOpenBox(this.box);

  @override
  Future<void> execute(Store<AppState> store) async {
    try {
      final url = '/v1/slots/open/' + box.id.toString();
      store.dispatch(OnBeginLoad('Пытаемся открыть ячейку'));

      final client = await HttpClient.instance();
      final response = await client.get(url);

      if (response.statusCode == 204) {
        store.dispatch(OnSuccess('Ячейка открыта'));
      } else {
        store.dispatch(OnError('Данной ячейки не существует'));
      }
    } on NetworkException catch (e) {
      store.dispatch(OnError(e.message));
    } catch (e) {
      store.dispatch(OnError('Ошибка подключения к сети'));
    }
  }
}
