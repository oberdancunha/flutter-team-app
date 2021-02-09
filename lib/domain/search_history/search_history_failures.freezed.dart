// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_history_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchHistoryFailureTearOff {
  const _$SearchHistoryFailureTearOff();

// ignore: unused_element
  _DatabaseError databaseError() {
    return _DatabaseError();
  }
}

/// @nodoc
// ignore: unused_element
const $SearchHistoryFailure = _$SearchHistoryFailureTearOff();

/// @nodoc
mixin _$SearchHistoryFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult databaseError(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult databaseError(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult databaseError(_DatabaseError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult databaseError(_DatabaseError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SearchHistoryFailureCopyWith<$Res> {
  factory $SearchHistoryFailureCopyWith(SearchHistoryFailure value,
          $Res Function(SearchHistoryFailure) then) =
      _$SearchHistoryFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchHistoryFailureCopyWithImpl<$Res>
    implements $SearchHistoryFailureCopyWith<$Res> {
  _$SearchHistoryFailureCopyWithImpl(this._value, this._then);

  final SearchHistoryFailure _value;
  // ignore: unused_field
  final $Res Function(SearchHistoryFailure) _then;
}

/// @nodoc
abstract class _$DatabaseErrorCopyWith<$Res> {
  factory _$DatabaseErrorCopyWith(
          _DatabaseError value, $Res Function(_DatabaseError) then) =
      __$DatabaseErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$DatabaseErrorCopyWithImpl<$Res>
    extends _$SearchHistoryFailureCopyWithImpl<$Res>
    implements _$DatabaseErrorCopyWith<$Res> {
  __$DatabaseErrorCopyWithImpl(
      _DatabaseError _value, $Res Function(_DatabaseError) _then)
      : super(_value, (v) => _then(v as _DatabaseError));

  @override
  _DatabaseError get _value => super._value as _DatabaseError;
}

/// @nodoc
class _$_DatabaseError implements _DatabaseError {
  _$_DatabaseError();

  @override
  String toString() {
    return 'SearchHistoryFailure.databaseError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _DatabaseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult databaseError(),
  }) {
    assert(databaseError != null);
    return databaseError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult databaseError(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (databaseError != null) {
      return databaseError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult databaseError(_DatabaseError value),
  }) {
    assert(databaseError != null);
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult databaseError(_DatabaseError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class _DatabaseError implements SearchHistoryFailure {
  factory _DatabaseError() = _$_DatabaseError;
}
