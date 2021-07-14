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
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {required BoxesState boxesState,
      required TasksState tasksState,
      required AuthState authState,
      required StatusState statusState}) {
    return _AppState(
      boxesState: boxesState,
      tasksState: tasksState,
      authState: authState,
      statusState: statusState,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  BoxesState get boxesState => throw _privateConstructorUsedError;
  TasksState get tasksState => throw _privateConstructorUsedError;
  AuthState get authState => throw _privateConstructorUsedError;
  StatusState get statusState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {BoxesState boxesState,
      TasksState tasksState,
      AuthState authState,
      StatusState statusState});

  $BoxesStateCopyWith<$Res> get boxesState;
  $TasksStateCopyWith<$Res> get tasksState;
  $AuthStateCopyWith<$Res> get authState;
  $StatusStateCopyWith<$Res> get statusState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? boxesState = freezed,
    Object? tasksState = freezed,
    Object? authState = freezed,
    Object? statusState = freezed,
  }) {
    return _then(_value.copyWith(
      boxesState: boxesState == freezed
          ? _value.boxesState
          : boxesState // ignore: cast_nullable_to_non_nullable
              as BoxesState,
      tasksState: tasksState == freezed
          ? _value.tasksState
          : tasksState // ignore: cast_nullable_to_non_nullable
              as TasksState,
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState,
      statusState: statusState == freezed
          ? _value.statusState
          : statusState // ignore: cast_nullable_to_non_nullable
              as StatusState,
    ));
  }

  @override
  $BoxesStateCopyWith<$Res> get boxesState {
    return $BoxesStateCopyWith<$Res>(_value.boxesState, (value) {
      return _then(_value.copyWith(boxesState: value));
    });
  }

  @override
  $TasksStateCopyWith<$Res> get tasksState {
    return $TasksStateCopyWith<$Res>(_value.tasksState, (value) {
      return _then(_value.copyWith(tasksState: value));
    });
  }

  @override
  $AuthStateCopyWith<$Res> get authState {
    return $AuthStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value));
    });
  }

  @override
  $StatusStateCopyWith<$Res> get statusState {
    return $StatusStateCopyWith<$Res>(_value.statusState, (value) {
      return _then(_value.copyWith(statusState: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BoxesState boxesState,
      TasksState tasksState,
      AuthState authState,
      StatusState statusState});

  @override
  $BoxesStateCopyWith<$Res> get boxesState;
  @override
  $TasksStateCopyWith<$Res> get tasksState;
  @override
  $AuthStateCopyWith<$Res> get authState;
  @override
  $StatusStateCopyWith<$Res> get statusState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? boxesState = freezed,
    Object? tasksState = freezed,
    Object? authState = freezed,
    Object? statusState = freezed,
  }) {
    return _then(_AppState(
      boxesState: boxesState == freezed
          ? _value.boxesState
          : boxesState // ignore: cast_nullable_to_non_nullable
              as BoxesState,
      tasksState: tasksState == freezed
          ? _value.tasksState
          : tasksState // ignore: cast_nullable_to_non_nullable
              as TasksState,
      authState: authState == freezed
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState,
      statusState: statusState == freezed
          ? _value.statusState
          : statusState // ignore: cast_nullable_to_non_nullable
              as StatusState,
    ));
  }
}

/// @nodoc

class _$_AppState with DiagnosticableTreeMixin implements _AppState {
  const _$_AppState(
      {required this.boxesState,
      required this.tasksState,
      required this.authState,
      required this.statusState});

  @override
  final BoxesState boxesState;
  @override
  final TasksState tasksState;
  @override
  final AuthState authState;
  @override
  final StatusState statusState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(boxesState: $boxesState, tasksState: $tasksState, authState: $authState, statusState: $statusState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('boxesState', boxesState))
      ..add(DiagnosticsProperty('tasksState', tasksState))
      ..add(DiagnosticsProperty('authState', authState))
      ..add(DiagnosticsProperty('statusState', statusState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.boxesState, boxesState) ||
                const DeepCollectionEquality()
                    .equals(other.boxesState, boxesState)) &&
            (identical(other.tasksState, tasksState) ||
                const DeepCollectionEquality()
                    .equals(other.tasksState, tasksState)) &&
            (identical(other.authState, authState) ||
                const DeepCollectionEquality()
                    .equals(other.authState, authState)) &&
            (identical(other.statusState, statusState) ||
                const DeepCollectionEquality()
                    .equals(other.statusState, statusState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boxesState) ^
      const DeepCollectionEquality().hash(tasksState) ^
      const DeepCollectionEquality().hash(authState) ^
      const DeepCollectionEquality().hash(statusState);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required BoxesState boxesState,
      required TasksState tasksState,
      required AuthState authState,
      required StatusState statusState}) = _$_AppState;

  @override
  BoxesState get boxesState => throw _privateConstructorUsedError;
  @override
  TasksState get tasksState => throw _privateConstructorUsedError;
  @override
  AuthState get authState => throw _privateConstructorUsedError;
  @override
  StatusState get statusState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
