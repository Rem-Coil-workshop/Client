// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LogsViewModelTearOff {
  const _$LogsViewModelTearOff();

  Success success({required List<String> logs}) {
    return Success(
      logs: logs,
    );
  }

  OnEmpty onEmpty() {
    return const OnEmpty();
  }
}

/// @nodoc
const $LogsViewModel = _$LogsViewModelTearOff();

/// @nodoc
mixin _$LogsViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> logs) success,
    required TResult Function() onEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> logs)? success,
    TResult Function()? onEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(OnEmpty value) onEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(OnEmpty value)? onEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogsViewModelCopyWith<$Res> {
  factory $LogsViewModelCopyWith(
          LogsViewModel value, $Res Function(LogsViewModel) then) =
      _$LogsViewModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogsViewModelCopyWithImpl<$Res>
    implements $LogsViewModelCopyWith<$Res> {
  _$LogsViewModelCopyWithImpl(this._value, this._then);

  final LogsViewModel _value;
  // ignore: unused_field
  final $Res Function(LogsViewModel) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<String> logs});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$LogsViewModelCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? logs = freezed,
  }) {
    return _then(Success(
      logs: logs == freezed
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({required this.logs});

  @override
  final List<String> logs;

  @override
  String toString() {
    return 'LogsViewModel.success(logs: $logs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.logs, logs) ||
                const DeepCollectionEquality().equals(other.logs, logs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(logs);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> logs) success,
    required TResult Function() onEmpty,
  }) {
    return success(logs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> logs)? success,
    TResult Function()? onEmpty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(logs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(OnEmpty value) onEmpty,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(OnEmpty value)? onEmpty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements LogsViewModel {
  const factory Success({required List<String> logs}) = _$Success;

  List<String> get logs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnEmptyCopyWith<$Res> {
  factory $OnEmptyCopyWith(OnEmpty value, $Res Function(OnEmpty) then) =
      _$OnEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnEmptyCopyWithImpl<$Res> extends _$LogsViewModelCopyWithImpl<$Res>
    implements $OnEmptyCopyWith<$Res> {
  _$OnEmptyCopyWithImpl(OnEmpty _value, $Res Function(OnEmpty) _then)
      : super(_value, (v) => _then(v as OnEmpty));

  @override
  OnEmpty get _value => super._value as OnEmpty;
}

/// @nodoc

class _$OnEmpty implements OnEmpty {
  const _$OnEmpty();

  @override
  String toString() {
    return 'LogsViewModel.onEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> logs) success,
    required TResult Function() onEmpty,
  }) {
    return onEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> logs)? success,
    TResult Function()? onEmpty,
    required TResult orElse(),
  }) {
    if (onEmpty != null) {
      return onEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(OnEmpty value) onEmpty,
  }) {
    return onEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(OnEmpty value)? onEmpty,
    required TResult orElse(),
  }) {
    if (onEmpty != null) {
      return onEmpty(this);
    }
    return orElse();
  }
}

abstract class OnEmpty implements LogsViewModel {
  const factory OnEmpty() = _$OnEmpty;
}
