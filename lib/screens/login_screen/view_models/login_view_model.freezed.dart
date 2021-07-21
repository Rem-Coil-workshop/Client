// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginViewModelTearOff {
  const _$LoginViewModelTearOff();

  WithUsers withUsers({required List<User> users}) {
    return WithUsers(
      users: users,
    );
  }

  Load load() {
    return const Load();
  }
}

/// @nodoc
const $LoginViewModel = _$LoginViewModelTearOff();

/// @nodoc
mixin _$LoginViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users) withUsers,
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users)? withUsers,
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WithUsers value) withUsers,
    required TResult Function(Load value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WithUsers value)? withUsers,
    TResult Function(Load value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewModelCopyWith<$Res> {
  factory $LoginViewModelCopyWith(
          LoginViewModel value, $Res Function(LoginViewModel) then) =
      _$LoginViewModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginViewModelCopyWithImpl<$Res>
    implements $LoginViewModelCopyWith<$Res> {
  _$LoginViewModelCopyWithImpl(this._value, this._then);

  final LoginViewModel _value;
  // ignore: unused_field
  final $Res Function(LoginViewModel) _then;
}

/// @nodoc
abstract class $WithUsersCopyWith<$Res> {
  factory $WithUsersCopyWith(WithUsers value, $Res Function(WithUsers) then) =
      _$WithUsersCopyWithImpl<$Res>;
  $Res call({List<User> users});
}

/// @nodoc
class _$WithUsersCopyWithImpl<$Res> extends _$LoginViewModelCopyWithImpl<$Res>
    implements $WithUsersCopyWith<$Res> {
  _$WithUsersCopyWithImpl(WithUsers _value, $Res Function(WithUsers) _then)
      : super(_value, (v) => _then(v as WithUsers));

  @override
  WithUsers get _value => super._value as WithUsers;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(WithUsers(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$WithUsers implements WithUsers {
  const _$WithUsers({required this.users});

  @override
  final List<User> users;

  @override
  String toString() {
    return 'LoginViewModel.withUsers(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WithUsers &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  $WithUsersCopyWith<WithUsers> get copyWith =>
      _$WithUsersCopyWithImpl<WithUsers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users) withUsers,
    required TResult Function() load,
  }) {
    return withUsers(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users)? withUsers,
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (withUsers != null) {
      return withUsers(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WithUsers value) withUsers,
    required TResult Function(Load value) load,
  }) {
    return withUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WithUsers value)? withUsers,
    TResult Function(Load value)? load,
    required TResult orElse(),
  }) {
    if (withUsers != null) {
      return withUsers(this);
    }
    return orElse();
  }
}

abstract class WithUsers implements LoginViewModel {
  const factory WithUsers({required List<User> users}) = _$WithUsers;

  List<User> get users => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithUsersCopyWith<WithUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) then) =
      _$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCopyWithImpl<$Res> extends _$LoginViewModelCopyWithImpl<$Res>
    implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(Load _value, $Res Function(Load) _then)
      : super(_value, (v) => _then(v as Load));

  @override
  Load get _value => super._value as Load;
}

/// @nodoc

class _$Load implements Load {
  const _$Load();

  @override
  String toString() {
    return 'LoginViewModel.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users) withUsers,
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users)? withUsers,
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WithUsers value) withUsers,
    required TResult Function(Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WithUsers value)? withUsers,
    TResult Function(Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load implements LoginViewModel {
  const factory Load() = _$Load;
}
