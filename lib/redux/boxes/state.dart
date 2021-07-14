import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/box.dart';

part 'state.freezed.dart';

@freezed
abstract class BoxesState with _$BoxesState {
  static const initState = BoxesState(boxes: defaultBoxes);

  const factory BoxesState({
    @Default(<Box>[]) List<Box> boxes,
  }) = _BoxesState;
}

const box1 = Box(number: 1, id: 1, taskId: 1);
const box2 = Box(number: 2, id: 2, taskId: 1);
const box3 = Box(number: 3, id: 3, taskId: 1);
const box4 = Box(number: 4, id: 4, taskId: 1);

const defaultBoxes = [box1, box2, box3, box4];
