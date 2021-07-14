// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthViewModelTearOff {
  const _$AuthViewModelTearOff();

  Success success({required Employee employee}) {
    return Success(
      employee: employee,
    );
  }
}

/// @nodoc
const $AuthViewModel = _$AuthViewModelTearOff();

/// @nodoc
mixin _$AuthViewModel {
  Employee get employee => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Employee employee) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Employee employee)? success,
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
  $AuthViewModelCopyWith<AuthViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewModelCopyWith<$Res> {
  factory $AuthViewModelCopyWith(
          AuthViewModel value, $Res Function(AuthViewModel) then) =
      _$AuthViewModelCopyWithImpl<$Res>;
  $Res call({Employee employee});

  $EmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class _$AuthViewModelCopyWithImpl<$Res>
    implements $AuthViewModelCopyWith<$Res> {
  _$AuthViewModelCopyWithImpl(this._value, this._then);

  final AuthViewModel _value;
  // ignore: unused_field
  final $Res Function(AuthViewModel) _then;

  @override
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(_value.copyWith(
      employee: employee == freezed
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee,
    ));
  }

  @override
  $EmployeeCopyWith<$Res> get employee {
    return $EmployeeCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value));
    });
  }
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> implements $AuthViewModelCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({Employee employee});

  @override
  $EmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$AuthViewModelCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(Success(
      employee: employee == freezed
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Employee,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({required this.employee});

  @override
  final Employee employee;

  @override
  String toString() {
    return 'AuthViewModel.success(employee: $employee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.employee, employee) ||
                const DeepCollectionEquality()
                    .equals(other.employee, employee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(employee);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Employee employee) success,
  }) {
    return success(employee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Employee employee)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(employee);
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

abstract class Success implements AuthViewModel {
  const factory Success({required Employee employee}) = _$Success;

  @override
  Employee get employee => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
