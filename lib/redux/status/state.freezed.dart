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
class _$StatusStateTearOff {
  const _$StatusStateTearOff();

  _StatusState call(
      {String? message = null, bool isLoad = false, bool isError = false}) {
    return _StatusState(
      message: message,
      isLoad: isLoad,
      isError: isError,
    );
  }
}

/// @nodoc
const $StatusState = _$StatusStateTearOff();

/// @nodoc
mixin _$StatusState {
  String? get message => throw _privateConstructorUsedError;
  bool get isLoad => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusStateCopyWith<StatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusStateCopyWith<$Res> {
  factory $StatusStateCopyWith(
          StatusState value, $Res Function(StatusState) then) =
      _$StatusStateCopyWithImpl<$Res>;
  $Res call({String? message, bool isLoad, bool isError});
}

/// @nodoc
class _$StatusStateCopyWithImpl<$Res> implements $StatusStateCopyWith<$Res> {
  _$StatusStateCopyWithImpl(this._value, this._then);

  final StatusState _value;
  // ignore: unused_field
  final $Res Function(StatusState) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? isLoad = freezed,
    Object? isError = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoad: isLoad == freezed
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StatusStateCopyWith<$Res>
    implements $StatusStateCopyWith<$Res> {
  factory _$StatusStateCopyWith(
          _StatusState value, $Res Function(_StatusState) then) =
      __$StatusStateCopyWithImpl<$Res>;
  @override
  $Res call({String? message, bool isLoad, bool isError});
}

/// @nodoc
class __$StatusStateCopyWithImpl<$Res> extends _$StatusStateCopyWithImpl<$Res>
    implements _$StatusStateCopyWith<$Res> {
  __$StatusStateCopyWithImpl(
      _StatusState _value, $Res Function(_StatusState) _then)
      : super(_value, (v) => _then(v as _StatusState));

  @override
  _StatusState get _value => super._value as _StatusState;

  @override
  $Res call({
    Object? message = freezed,
    Object? isLoad = freezed,
    Object? isError = freezed,
  }) {
    return _then(_StatusState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoad: isLoad == freezed
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StatusState implements _StatusState {
  const _$_StatusState(
      {this.message = null, this.isLoad = false, this.isError = false});

  @JsonKey(defaultValue: null)
  @override
  final String? message;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoad;
  @JsonKey(defaultValue: false)
  @override
  final bool isError;

  @override
  String toString() {
    return 'StatusState(message: $message, isLoad: $isLoad, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatusState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.isLoad, isLoad) ||
                const DeepCollectionEquality().equals(other.isLoad, isLoad)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality().equals(other.isError, isError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(isLoad) ^
      const DeepCollectionEquality().hash(isError);

  @JsonKey(ignore: true)
  @override
  _$StatusStateCopyWith<_StatusState> get copyWith =>
      __$StatusStateCopyWithImpl<_StatusState>(this, _$identity);
}

abstract class _StatusState implements StatusState {
  const factory _StatusState({String? message, bool isLoad, bool isError}) =
      _$_StatusState;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  bool get isLoad => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusStateCopyWith<_StatusState> get copyWith =>
      throw _privateConstructorUsedError;
}
