import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/box.dart';

part 'state.freezed.dart';

@freezed
class BoxesState with _$BoxesState {
  static const initState = BoxesState();

  const factory BoxesState({
    @Default(<Box>[]) List<Box> boxes,
  }) = _BoxesState;
}