// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'employees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmployeesViewModelTearOff {
  const _$EmployeesViewModelTearOff();

  Success success({required List<Employee> employees}) {
    return Success(
      employees: employees,
    );
  }
}

/// @nodoc
const $EmployeesViewModel = _$EmployeesViewModelTearOff();

/// @nodoc
mixin _$EmployeesViewModel {
  List<Employee> get employees => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Employee> employees) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Employee> employees)? success,
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
  $EmployeesViewModelCopyWith<EmployeesViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeesViewModelCopyWith<$Res> {
  factory $EmployeesViewModelCopyWith(
          EmployeesViewModel value, $Res Function(EmployeesViewModel) then) =
      _$EmployeesViewModelCopyWithImpl<$Res>;
  $Res call({List<Employee> employees});
}

/// @nodoc
class _$EmployeesViewModelCopyWithImpl<$Res>
    implements $EmployeesViewModelCopyWith<$Res> {
  _$EmployeesViewModelCopyWithImpl(this._value, this._then);

  final EmployeesViewModel _value;
  // ignore: unused_field
  final $Res Function(EmployeesViewModel) _then;

  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_value.copyWith(
      employees: employees == freezed
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
    ));
  }
}

/// @nodoc
abstract class $SuccessCopyWith<$Res>
    implements $EmployeesViewModelCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<Employee> employees});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$EmployeesViewModelCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(Success(
      employees: employees == freezed
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({required this.employees});

  @override
  final List<Employee> employees;

  @override
  String toString() {
    return 'EmployeesViewModel.success(employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.employees, employees) ||
                const DeepCollectionEquality()
                    .equals(other.employees, employees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(employees);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Employee> employees) success,
  }) {
    return success(employees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Employee> employees)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(employees);
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

abstract class Success implements EmployeesViewModel {
  const factory Success({required List<Employee> employees}) = _$Success;

  @override
  List<Employee> get employees => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
