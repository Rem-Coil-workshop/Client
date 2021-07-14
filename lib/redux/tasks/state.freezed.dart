// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TasksStateTearOff {
  const _$TasksStateTearOff();

  _TasksState call({List<Task> tasks = const <Task>[]}) {
    return _TasksState(
      tasks: tasks,
    );
  }
}

/// @nodoc
const $TasksState = _$TasksStateTearOff();

/// @nodoc
mixin _$TasksState {
  List<Task> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res>;
  $Res call({List<Task> tasks});
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res> implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  final TasksState _value;
  // ignore: unused_field
  final $Res Function(TasksState) _then;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$TasksStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory _$TasksStateCopyWith(
          _TasksState value, $Res Function(_TasksState) then) =
      __$TasksStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$TasksStateCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements _$TasksStateCopyWith<$Res> {
  __$TasksStateCopyWithImpl(
      _TasksState _value, $Res Function(_TasksState) _then)
      : super(_value, (v) => _then(v as _TasksState));

  @override
  _TasksState get _value => super._value as _TasksState;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_TasksState(
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_TasksState implements _TasksState {
  const _$_TasksState({this.tasks = const <Task>[]});

  @JsonKey(defaultValue: const <Task>[])
  @override
  final List<Task> tasks;

  @override
  String toString() {
    return 'TasksState(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TasksState &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tasks);

  @JsonKey(ignore: true)
  @override
  _$TasksStateCopyWith<_TasksState> get copyWith =>
      __$TasksStateCopyWithImpl<_TasksState>(this, _$identity);
}

abstract class _TasksState implements TasksState {
  const factory _TasksState({List<Task> tasks}) = _$_TasksState;

  @override
  List<Task> get tasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TasksStateCopyWith<_TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}
