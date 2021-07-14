import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/boxes/state.dart';

import 'actions.dart';

final boxesReducer = combineReducers<BoxesState>([
  TypedReducer<BoxesState, SetBoxesAction>(_setBoxes),
]);

BoxesState _setBoxes(BoxesState state, SetBoxesAction action) =>
    state.copyWith(boxes: action.boxes);
