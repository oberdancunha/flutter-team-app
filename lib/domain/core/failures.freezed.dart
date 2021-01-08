// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

// ignore: unused_element
  _ServerError serverError() {
    return const _ServerError();
  }

// ignore: unused_element
  _IsNotConnected isNotConnected() {
    return const _IsNotConnected();
  }
}

/// @nodoc
// ignore: unused_element
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(),
    @required TResult isNotConnected(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(),
    TResult isNotConnected(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(_ServerError value),
    @required TResult isNotConnected(_IsNotConnected value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(_ServerError value),
    TResult isNotConnected(_IsNotConnected value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

/// @nodoc
class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'Failure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(),
    @required TResult isNotConnected(),
  }) {
    assert(serverError != null);
    assert(isNotConnected != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(),
    TResult isNotConnected(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(_ServerError value),
    @required TResult isNotConnected(_IsNotConnected value),
  }) {
    assert(serverError != null);
    assert(isNotConnected != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(_ServerError value),
    TResult isNotConnected(_IsNotConnected value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements Failure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$IsNotConnectedCopyWith<$Res> {
  factory _$IsNotConnectedCopyWith(
          _IsNotConnected value, $Res Function(_IsNotConnected) then) =
      __$IsNotConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$IsNotConnectedCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$IsNotConnectedCopyWith<$Res> {
  __$IsNotConnectedCopyWithImpl(
      _IsNotConnected _value, $Res Function(_IsNotConnected) _then)
      : super(_value, (v) => _then(v as _IsNotConnected));

  @override
  _IsNotConnected get _value => super._value as _IsNotConnected;
}

/// @nodoc
class _$_IsNotConnected implements _IsNotConnected {
  const _$_IsNotConnected();

  @override
  String toString() {
    return 'Failure.isNotConnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _IsNotConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(),
    @required TResult isNotConnected(),
  }) {
    assert(serverError != null);
    assert(isNotConnected != null);
    return isNotConnected();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(),
    TResult isNotConnected(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isNotConnected != null) {
      return isNotConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(_ServerError value),
    @required TResult isNotConnected(_IsNotConnected value),
  }) {
    assert(serverError != null);
    assert(isNotConnected != null);
    return isNotConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(_ServerError value),
    TResult isNotConnected(_IsNotConnected value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (isNotConnected != null) {
      return isNotConnected(this);
    }
    return orElse();
  }
}

abstract class _IsNotConnected implements Failure {
  const factory _IsNotConnected() = _$_IsNotConnected;
}
