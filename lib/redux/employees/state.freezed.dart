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
class _$EmployeesStateTearOff {
  const _$EmployeesStateTearOff();

  _EmployeesState call({List<Employee> employees = const <Employee>[]}) {
    return _EmployeesState(
      employees: employees,
    );
  }
}

/// @nodoc
const $EmployeesState = _$EmployeesStateTearOff();

/// @nodoc
mixin _$EmployeesState {
  List<Employee> get employees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeesStateCopyWith<EmployeesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeesStateCopyWith<$Res> {
  factory $EmployeesStateCopyWith(
          EmployeesState value, $Res Function(EmployeesState) then) =
      _$EmployeesStateCopyWithImpl<$Res>;
  $Res call({List<Employee> employees});
}

/// @nodoc
class _$EmployeesStateCopyWithImpl<$Res>
    implements $EmployeesStateCopyWith<$Res> {
  _$EmployeesStateCopyWithImpl(this._value, this._then);

  final EmployeesState _value;
  // ignore: unused_field
  final $Res Function(EmployeesState) _then;

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
abstract class _$EmployeesStateCopyWith<$Res>
    implements $EmployeesStateCopyWith<$Res> {
  factory _$EmployeesStateCopyWith(
          _EmployeesState value, $Res Function(_EmployeesState) then) =
      __$EmployeesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Employee> employees});
}

/// @nodoc
class __$EmployeesStateCopyWithImpl<$Res>
    extends _$EmployeesStateCopyWithImpl<$Res>
    implements _$EmployeesStateCopyWith<$Res> {
  __$EmployeesStateCopyWithImpl(
      _EmployeesState _value, $Res Function(_EmployeesState) _then)
      : super(_value, (v) => _then(v as _EmployeesState));

  @override
  _EmployeesState get _value => super._value as _EmployeesState;

  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_EmployeesState(
      employees: employees == freezed
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
    ));
  }
}

/// @nodoc

class _$_EmployeesState implements _EmployeesState {
  const _$_EmployeesState({this.employees = const <Employee>[]});

  @JsonKey(defaultValue: const <Employee>[])
  @override
  final List<Employee> employees;

  @override
  String toString() {
    return 'EmployeesState(employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmployeesState &&
            (identical(other.employees, employees) ||
                const DeepCollectionEquality()
                    .equals(other.employees, employees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(employees);

  @JsonKey(ignore: true)
  @override
  _$EmployeesStateCopyWith<_EmployeesState> get copyWith =>
      __$EmployeesStateCopyWithImpl<_EmployeesState>(this, _$identity);
}

abstract class _EmployeesState implements EmployeesState {
  const factory _EmployeesState({List<Employee> employees}) = _$_EmployeesState;

  @override
  List<Employee> get employees => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmployeesStateCopyWith<_EmployeesState> get copyWith =>
      throw _privateConstructorUsedError;
}
