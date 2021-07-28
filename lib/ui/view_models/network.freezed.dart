// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkViewModelTearOff {
  const _$NetworkViewModelTearOff();

  NewConfig newConfig({required String host, required int port}) {
    return NewConfig(
      host: host,
      port: port,
    );
  }
}

/// @nodoc
const $NetworkViewModel = _$NetworkViewModelTearOff();

/// @nodoc
mixin _$NetworkViewModel {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String host, int port) newConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String host, int port)? newConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewConfig value) newConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewConfig value)? newConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkViewModelCopyWith<NetworkViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkViewModelCopyWith<$Res> {
  factory $NetworkViewModelCopyWith(
          NetworkViewModel value, $Res Function(NetworkViewModel) then) =
      _$NetworkViewModelCopyWithImpl<$Res>;
  $Res call({String host, int port});
}

/// @nodoc
class _$NetworkViewModelCopyWithImpl<$Res>
    implements $NetworkViewModelCopyWith<$Res> {
  _$NetworkViewModelCopyWithImpl(this._value, this._then);

  final NetworkViewModel _value;
  // ignore: unused_field
  final $Res Function(NetworkViewModel) _then;

  @override
  $Res call({
    Object? host = freezed,
    Object? port = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $NewConfigCopyWith<$Res>
    implements $NetworkViewModelCopyWith<$Res> {
  factory $NewConfigCopyWith(NewConfig value, $Res Function(NewConfig) then) =
      _$NewConfigCopyWithImpl<$Res>;
  @override
  $Res call({String host, int port});
}

/// @nodoc
class _$NewConfigCopyWithImpl<$Res> extends _$NetworkViewModelCopyWithImpl<$Res>
    implements $NewConfigCopyWith<$Res> {
  _$NewConfigCopyWithImpl(NewConfig _value, $Res Function(NewConfig) _then)
      : super(_value, (v) => _then(v as NewConfig));

  @override
  NewConfig get _value => super._value as NewConfig;

  @override
  $Res call({
    Object? host = freezed,
    Object? port = freezed,
  }) {
    return _then(NewConfig(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewConfig implements NewConfig {
  const _$NewConfig({required this.host, required this.port});

  @override
  final String host;
  @override
  final int port;

  @override
  String toString() {
    return 'NetworkViewModel.newConfig(host: $host, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewConfig &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(port);

  @JsonKey(ignore: true)
  @override
  $NewConfigCopyWith<NewConfig> get copyWith =>
      _$NewConfigCopyWithImpl<NewConfig>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String host, int port) newConfig,
  }) {
    return newConfig(host, port);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String host, int port)? newConfig,
    required TResult orElse(),
  }) {
    if (newConfig != null) {
      return newConfig(host, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewConfig value) newConfig,
  }) {
    return newConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewConfig value)? newConfig,
    required TResult orElse(),
  }) {
    if (newConfig != null) {
      return newConfig(this);
    }
    return orElse();
  }
}

abstract class NewConfig implements NetworkViewModel {
  const factory NewConfig({required String host, required int port}) =
      _$NewConfig;

  @override
  String get host => throw _privateConstructorUsedError;
  @override
  int get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $NewConfigCopyWith<NewConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
