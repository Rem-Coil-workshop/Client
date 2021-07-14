// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BoxTearOff {
  const _$BoxTearOff();

  _Box call({required int id, required int number, required int taskId}) {
    return _Box(
      id: id,
      number: number,
      taskId: taskId,
    );
  }
}

/// @nodoc
const $Box = _$BoxTearOff();

/// @nodoc
mixin _$Box {
  int get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  int get taskId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoxCopyWith<Box> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxCopyWith<$Res> {
  factory $BoxCopyWith(Box value, $Res Function(Box) then) =
      _$BoxCopyWithImpl<$Res>;
  $Res call({int id, int number, int taskId});
}

/// @nodoc
class _$BoxCopyWithImpl<$Res> implements $BoxCopyWith<$Res> {
  _$BoxCopyWithImpl(this._value, this._then);

  final Box _value;
  // ignore: unused_field
  final $Res Function(Box) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BoxCopyWith<$Res> implements $BoxCopyWith<$Res> {
  factory _$BoxCopyWith(_Box value, $Res Function(_Box) then) =
      __$BoxCopyWithImpl<$Res>;
  @override
  $Res call({int id, int number, int taskId});
}

/// @nodoc
class __$BoxCopyWithImpl<$Res> extends _$BoxCopyWithImpl<$Res>
    implements _$BoxCopyWith<$Res> {
  __$BoxCopyWithImpl(_Box _value, $Res Function(_Box) _then)
      : super(_value, (v) => _then(v as _Box));

  @override
  _Box get _value => super._value as _Box;

  @override
  $Res call({
    Object? id = freezed,
    Object? number = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_Box(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Box implements _Box {
  const _$_Box({required this.id, required this.number, required this.taskId});

  @override
  final int id;
  @override
  final int number;
  @override
  final int taskId;

  @override
  String toString() {
    return 'Box(id: $id, number: $number, taskId: $taskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Box &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(taskId);

  @JsonKey(ignore: true)
  @override
  _$BoxCopyWith<_Box> get copyWith =>
      __$BoxCopyWithImpl<_Box>(this, _$identity);
}

abstract class _Box implements Box {
  const factory _Box(
      {required int id, required int number, required int taskId}) = _$_Box;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get number => throw _privateConstructorUsedError;
  @override
  int get taskId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BoxCopyWith<_Box> get copyWith => throw _privateConstructorUsedError;
}
