import 'package:slot_service_app/redux/state.dart';

import 'boxes/reducer.dart';
import 'tasks/reducer.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
  tasksState: tasksReducer(state.tasksState, action),
  boxesState: boxesReducer(state.boxesState, action),
);