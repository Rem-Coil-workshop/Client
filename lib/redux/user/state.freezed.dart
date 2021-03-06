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
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {List<User> users = const [],
      User? currentUser,
      bool isEntered = false,
      bool isPasswordCorrect = true}) {
    return _AuthState(
      users: users,
      currentUser: currentUser,
      isEntered: isEntered,
      isPasswordCorrect: isPasswordCorrect,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  List<User> get users => throw _privateConstructorUsedError;
  User? get currentUser => throw _privateConstructorUsedError;
  bool get isEntered => throw _privateConstructorUsedError;
  bool get isPasswordCorrect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {List<User> users,
      User? currentUser,
      bool isEntered,
      bool isPasswordCorrect});

  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? currentUser = freezed,
    Object? isEntered = freezed,
    Object? isPasswordCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
      isEntered: isEntered == freezed
          ? _value.isEntered
          : isEntered // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordCorrect: isPasswordCorrect == freezed
          ? _value.isPasswordCorrect
          : isPasswordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<User> users,
      User? currentUser,
      bool isEntered,
      bool isPasswordCorrect});

  @override
  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? users = freezed,
    Object? currentUser = freezed,
    Object? isEntered = freezed,
    Object? isPasswordCorrect = freezed,
  }) {
    return _then(_AuthState(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
      isEntered: isEntered == freezed
          ? _value.isEntered
          : isEntered // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordCorrect: isPasswordCorrect == freezed
          ? _value.isPasswordCorrect
          : isPasswordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.users = const [],
      this.currentUser,
      this.isEntered = false,
      this.isPasswordCorrect = true});

  @JsonKey(defaultValue: const [])
  @override
  final List<User> users;
  @override
  final User? currentUser;
  @JsonKey(defaultValue: false)
  @override
  final bool isEntered;
  @JsonKey(defaultValue: true)
  @override
  final bool isPasswordCorrect;

  @override
  String toString() {
    return 'AuthState(users: $users, currentUser: $currentUser, isEntered: $isEntered, isPasswordCorrect: $isPasswordCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.isEntered, isEntered) ||
                const DeepCollectionEquality()
                    .equals(other.isEntered, isEntered)) &&
            (identical(other.isPasswordCorrect, isPasswordCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordCorrect, isPasswordCorrect)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(isEntered) ^
      const DeepCollectionEquality().hash(isPasswordCorrect);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {List<User> users,
      User? currentUser,
      bool isEntered,
      bool isPasswordCorrect}) = _$_AuthState;

  @override
  List<User> get users => throw _privateConstructorUsedError;
  @override
  User? get currentUser => throw _privateConstructorUsedError;
  @override
  bool get isEntered => throw _privateConstructorUsedError;
  @override
  bool get isPasswordCorrect => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
