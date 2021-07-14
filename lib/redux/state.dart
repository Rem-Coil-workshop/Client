import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:slot_service_app/redux/boxes/state.dart';
import 'package:slot_service_app/redux/tasks/state.dart';

part 'state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  static const initState = AppState(
    boxesState: BoxesState.initState,
    tasksState: TasksState.initState,
  );

  const factory AppState({
    required BoxesState boxesState,
    required TasksState tasksState,
  }) = _AppState;
}
