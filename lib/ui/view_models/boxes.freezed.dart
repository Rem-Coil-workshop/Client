// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'boxes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BoxesViewModelTearOff {
  const _$BoxesViewModelTearOff();

  Success success({required List<Box> boxes}) {
    return Success(
      boxes: boxes,
    );
  }
}

/// @nodoc
const $BoxesViewModel = _$BoxesViewModelTearOff();

/// @nodoc
mixin _$BoxesViewModel {
  List<Box> get boxes => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Box> boxes) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Box> boxes)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoxesViewModelCopyWith<BoxesViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxesViewModelCopyWith<$Res> {
  factory $BoxesViewModelCopyWith(
          BoxesViewModel value, $Res Function(BoxesViewModel) then) =
      _$BoxesViewModelCopyWithImpl<$Res>;
  $Res call({List<Box> boxes});
}

/// @nodoc
class _$BoxesViewModelCopyWithImpl<$Res>
    implements $BoxesViewModelCopyWith<$Res> {
  _$BoxesViewModelCopyWithImpl(this._value, this._then);

  final BoxesViewModel _value;
  // ignore: unused_field
  final $Res Function(BoxesViewModel) _then;

  @override
  $Res call({
    Object? boxes = freezed,
  }) {
    return _then(_value.copyWith(
      boxes: boxes == freezed
          ? _value.boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
    ));
  }
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> implements $BoxesViewModelCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<Box> boxes});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$BoxesViewModelCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? boxes = freezed,
  }) {
    return _then(Success(
      boxes: boxes == freezed
          ? _value.boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({required this.boxes});

  @override
  final List<Box> boxes;

  @override
  String toString() {
    return 'BoxesViewModel.success(boxes: $boxes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.boxes, boxes) ||
                const DeepCollectionEquality().equals(other.boxes, boxes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(boxes);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Box> boxes) success,
  }) {
    return success(boxes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Box> boxes)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(boxes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements BoxesViewModel {
  const factory Success({required List<Box> boxes}) = _$Success;

  @override
  List<Box> get boxes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
