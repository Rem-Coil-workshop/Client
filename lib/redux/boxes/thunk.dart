import 'package:redux/redux.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/boxes_repository.dart';
import 'package:slot_service_app/redux/base_thunk.dart';
import 'package:slot_service_app/redux/boxes/actions.dart';
import 'package:slot_service_app/redux/state.dart';

class OnTaskChange extends BaseThunk<BoxesRepository> {
  final Box box;
  final Task task;

  OnTaskChange({required this.box, required this.task});

  @override
  Future<void> execute(
      Store<AppState> store, BoxesRepository repository) async {
    store.dispatch(SetBoxesAction([]));
    repository.changeBoxTask(box, task);
    store.dispatch(OnFetchBoxes());
  }
}

class OnFetchBoxes extends BaseThunk<BoxesRepository> {
  @override
  Future<void> execute(
      Store<AppState> store, BoxesRepository repository) async {
    store.dispatch(SetBoxesAction(repository.boxes));
  }
}
