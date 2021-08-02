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
class _$ServerLogsStateTearOff {
  const _$ServerLogsStateTearOff();

  _ServerLogsState call({List<String> logsFiles = const <String>[]}) {
    return _ServerLogsState(
      logsFiles: logsFiles,
    );
  }
}

/// @nodoc
const $ServerLogsState = _$ServerLogsStateTearOff();

/// @nodoc
mixin _$ServerLogsState {
  List<String> get logsFiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerLogsStateCopyWith<ServerLogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerLogsStateCopyWith<$Res> {
  factory $ServerLogsStateCopyWith(
          ServerLogsState value, $Res Function(ServerLogsState) then) =
      _$ServerLogsStateCopyWithImpl<$Res>;
  $Res call({List<String> logsFiles});
}

/// @nodoc
class _$ServerLogsStateCopyWithImpl<$Res>
    implements $ServerLogsStateCopyWith<$Res> {
  _$ServerLogsStateCopyWithImpl(this._value, this._then);

  final ServerLogsState _value;
  // ignore: unused_field
  final $Res Function(ServerLogsState) _then;

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
abstract class _$ServerLogsStateCopyWith<$Res>
    implements $ServerLogsStateCopyWith<$Res> {
  factory _$ServerLogsStateCopyWith(
          _ServerLogsState value, $Res Function(_ServerLogsState) then) =
      __$ServerLogsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> logsFiles});
}

/// @nodoc
class __$ServerLogsStateCopyWithImpl<$Res>
    extends _$ServerLogsStateCopyWithImpl<$Res>
    implements _$ServerLogsStateCopyWith<$Res> {
  __$ServerLogsStateCopyWithImpl(
      _ServerLogsState _value, $Res Function(_ServerLogsState) _then)
      : super(_value, (v) => _then(v as _ServerLogsState));

  @override
  _ServerLogsState get _value => super._value as _ServerLogsState;

  @override
  $Res call({
    Object? logsFiles = freezed,
  }) {
    return _then(_ServerLogsState(
      logsFiles: logsFiles == freezed
          ? _value.logsFiles
          : logsFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ServerLogsState implements _ServerLogsState {
  const _$_ServerLogsState({this.logsFiles = const <String>[]});

  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> logsFiles;

  @override
  String toString() {
    return 'ServerLogsState(logsFiles: $logsFiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerLogsState &&
            (identical(other.logsFiles, logsFiles) ||
                const DeepCollectionEquality()
                    .equals(other.logsFiles, logsFiles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(logsFiles);

  @JsonKey(ignore: true)
  @override
  _$ServerLogsStateCopyWith<_ServerLogsState> get copyWith =>
      __$ServerLogsStateCopyWithImpl<_ServerLogsState>(this, _$identity);
}

abstract class _ServerLogsState implements ServerLogsState {
  const factory _ServerLogsState({List<String> logsFiles}) = _$_ServerLogsState;

  @override
  List<String> get logsFiles => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerLogsStateCopyWith<_ServerLogsState> get copyWith =>
      throw _privateConstructorUsedError;
}
