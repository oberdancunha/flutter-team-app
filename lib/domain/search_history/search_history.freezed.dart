// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchHistoryTearOff {
  const _$SearchHistoryTearOff();

// ignore: unused_element
  _SearchHistory call(
      {@required int position, @required SearchTerm teamSearch}) {
    return _SearchHistory(
      position: position,
      teamSearch: teamSearch,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchHistory = _$SearchHistoryTearOff();

/// @nodoc
mixin _$SearchHistory {
  int get position;
  SearchTerm get teamSearch;

  $SearchHistoryCopyWith<SearchHistory> get copyWith;
}

/// @nodoc
abstract class $SearchHistoryCopyWith<$Res> {
  factory $SearchHistoryCopyWith(
          SearchHistory value, $Res Function(SearchHistory) then) =
      _$SearchHistoryCopyWithImpl<$Res>;
  $Res call({int position, SearchTerm teamSearch});
}

/// @nodoc
class _$SearchHistoryCopyWithImpl<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  _$SearchHistoryCopyWithImpl(this._value, this._then);

  final SearchHistory _value;
  // ignore: unused_field
  final $Res Function(SearchHistory) _then;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchTerm,
    ));
  }
}

/// @nodoc
abstract class _$SearchHistoryCopyWith<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  factory _$SearchHistoryCopyWith(
          _SearchHistory value, $Res Function(_SearchHistory) then) =
      __$SearchHistoryCopyWithImpl<$Res>;
  @override
  $Res call({int position, SearchTerm teamSearch});
}

/// @nodoc
class __$SearchHistoryCopyWithImpl<$Res>
    extends _$SearchHistoryCopyWithImpl<$Res>
    implements _$SearchHistoryCopyWith<$Res> {
  __$SearchHistoryCopyWithImpl(
      _SearchHistory _value, $Res Function(_SearchHistory) _then)
      : super(_value, (v) => _then(v as _SearchHistory));

  @override
  _SearchHistory get _value => super._value as _SearchHistory;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_SearchHistory(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchTerm,
    ));
  }
}

/// @nodoc
class _$_SearchHistory extends _SearchHistory {
  _$_SearchHistory({@required this.position, @required this.teamSearch})
      : assert(position != null),
        assert(teamSearch != null),
        super._();

  @override
  final int position;
  @override
  final SearchTerm teamSearch;

  @override
  String toString() {
    return 'SearchHistory(position: $position, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchHistory &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(teamSearch);

  @override
  _$SearchHistoryCopyWith<_SearchHistory> get copyWith =>
      __$SearchHistoryCopyWithImpl<_SearchHistory>(this, _$identity);
}

abstract class _SearchHistory extends SearchHistory {
  _SearchHistory._() : super._();
  factory _SearchHistory(
      {@required int position,
      @required SearchTerm teamSearch}) = _$_SearchHistory;

  @override
  int get position;
  @override
  SearchTerm get teamSearch;
  @override
  _$SearchHistoryCopyWith<_SearchHistory> get copyWith;
}
