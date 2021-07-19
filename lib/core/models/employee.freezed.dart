// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmployeeTearOff {
  const _$EmployeeTearOff();

  _Employee call(
      {required String firstname,
      required String lastname,
      required int number}) {
    return _Employee(
      firstname: firstname,
      lastname: lastname,
      number: number,
    );
  }
}

/// @nodoc
const $Employee = _$EmployeeTearOff();

/// @nodoc
mixin _$Employee {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res>;
  $Res call({String firstname, String lastname, int number});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res> implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  final Employee _value;
  // ignore: unused_field
  final $Res Function(Employee) _then;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) then) =
      __$EmployeeCopyWithImpl<$Res>;
  @override
  $Res call({String firstname, String lastname, int number});
}

/// @nodoc
class __$EmployeeCopyWithImpl<$Res> extends _$EmployeeCopyWithImpl<$Res>
    implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(_Employee _value, $Res Function(_Employee) _then)
      : super(_value, (v) => _then(v as _Employee));

  @override
  _Employee get _value => super._value as _Employee;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? number = freezed,
  }) {
    return _then(_Employee(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Employee implements _Employee {
  const _$_Employee(
      {required this.firstname, required this.lastname, required this.number});

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final int number;

  @override
  String toString() {
    return 'Employee(firstname: $firstname, lastname: $lastname, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Employee &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(number);

  @JsonKey(ignore: true)
  @override
  _$EmployeeCopyWith<_Employee> get copyWith =>
      __$EmployeeCopyWithImpl<_Employee>(this, _$identity);
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {required String firstname,
      required String lastname,
      required int number}) = _$_Employee;

  @override
  String get firstname => throw _privateConstructorUsedError;
  @override
  String get lastname => throw _privateConstructorUsedError;
  @override
  int get number => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmployeeCopyWith<_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
