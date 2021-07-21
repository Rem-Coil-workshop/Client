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

  Success success({required User user}) {
    return Success(
      user: user,
    );
  }

  NoUser noUser() {
    return const NoUser();
  }
}

/// @nodoc
const $AuthViewModel = _$AuthViewModelTearOff();

/// @nodoc
mixin _$AuthViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function() noUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function()? noUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(NoUser value) noUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(NoUser value)? noUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewModelCopyWith<$Res> {
  factory $AuthViewModelCopyWith(
          AuthViewModel value, $Res Function(AuthViewModel) then) =
      _$AuthViewModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthViewModelCopyWithImpl<$Res>
    implements $AuthViewModelCopyWith<$Res> {
  _$AuthViewModelCopyWithImpl(this._value, this._then);

  final AuthViewModel _value;
  // ignore: unused_field
  final $Res Function(AuthViewModel) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
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
    Object? user = freezed,
  }) {
    return _then(Success(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthViewModel.success(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function() noUser,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function()? noUser,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(NoUser value) noUser,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(NoUser value)? noUser,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AuthViewModel {
  const factory Success({required User user}) = _$Success;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoUserCopyWith<$Res> {
  factory $NoUserCopyWith(NoUser value, $Res Function(NoUser) then) =
      _$NoUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoUserCopyWithImpl<$Res> extends _$AuthViewModelCopyWithImpl<$Res>
    implements $NoUserCopyWith<$Res> {
  _$NoUserCopyWithImpl(NoUser _value, $Res Function(NoUser) _then)
      : super(_value, (v) => _then(v as NoUser));

  @override
  NoUser get _value => super._value as NoUser;
}

/// @nodoc

class _$NoUser implements NoUser {
  const _$NoUser();

  @override
  String toString() {
    return 'AuthViewModel.noUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function() noUser,
  }) {
    return noUser();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function()? noUser,
    required TResult orElse(),
  }) {
    if (noUser != null) {
      return noUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(NoUser value) noUser,
  }) {
    return noUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(NoUser value)? noUser,
    required TResult orElse(),
  }) {
    if (noUser != null) {
      return noUser(this);
    }
    return orElse();
  }
}

abstract class NoUser implements AuthViewModel {
  const factory NoUser() = _$NoUser;
}
