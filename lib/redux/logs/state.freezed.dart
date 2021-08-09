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
class _$LogsStateTearOff {
  const _$LogsStateTearOff();

  _LogsState call({List<String> logsFiles = const <String>[]}) {
    return _LogsState(
      logsFiles: logsFiles,
    );
  }
}

/// @nodoc
const $LogsState = _$LogsStateTearOff();

/// @nodoc
mixin _$LogsState {
  List<String> get logsFiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogsStateCopyWith<LogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogsStateCopyWith<$Res> {
  factory $LogsStateCopyWith(LogsState value, $Res Function(LogsState) then) =
      _$LogsStateCopyWithImpl<$Res>;
  $Res call({List<String> logsFiles});
}

/// @nodoc
class _$LogsStateCopyWithImpl<$Res> implements $LogsStateCopyWith<$Res> {
  _$LogsStateCopyWithImpl(this._value, this._then);

  final LogsState _value;
  // ignore: unused_field
  final $Res Function(LogsState) _then;

  @override
  $Res call({
    Object? logsFiles = freezed,
  }) {
    return _then(_value.copyWith(
      logsFiles: logsFiles == freezed
          ? _value.logsFiles
          : logsFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$LogsStateCopyWith<$Res> implements $LogsStateCopyWith<$Res> {
  factory _$LogsStateCopyWith(
          _LogsState value, $Res Function(_LogsState) then) =
      __$LogsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> logsFiles});
}

/// @nodoc
class __$LogsStateCopyWithImpl<$Res> extends _$LogsStateCopyWithImpl<$Res>
    implements _$LogsStateCopyWith<$Res> {
  __$LogsStateCopyWithImpl(_LogsState _value, $Res Function(_LogsState) _then)
      : super(_value, (v) => _then(v as _LogsState));

  @override
  _LogsState get _value => super._value as _LogsState;

  @override
  $Res call({
    Object? logsFiles = freezed,
  }) {
    return _then(_LogsState(
      logsFiles: logsFiles == freezed
          ? _value.logsFiles
          : logsFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_LogsState implements _LogsState {
  const _$_LogsState({this.logsFiles = const <String>[]});

  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> logsFiles;

  @override
  String toString() {
    return 'LogsState(logsFiles: $logsFiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LogsState &&
            (identical(other.logsFiles, logsFiles) ||
                const DeepCollectionEquality()
                    .equals(other.logsFiles, logsFiles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(logsFiles);

  @JsonKey(ignore: true)
  @override
  _$LogsStateCopyWith<_LogsState> get copyWith =>
      __$LogsStateCopyWithImpl<_LogsState>(this, _$identity);
}

abstract class _LogsState implements LogsState {
  const factory _LogsState({List<String> logsFiles}) = _$_LogsState;

  @override
  List<String> get logsFiles => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LogsStateCopyWith<_LogsState> get copyWith =>
      throw _privateConstructorUsedError;
}
