// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchTearOff {
  const _$SearchTearOff();

// ignore: unused_element
  _Search call({@required int position, @required SearchTerm teamSearch}) {
    return _Search(
      position: position,
      teamSearch: teamSearch,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Search = _$SearchTearOff();

/// @nodoc
mixin _$Search {
  int get position;
  SearchTerm get teamSearch;

  $SearchCopyWith<Search> get copyWith;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res>;
  $Res call({int position, SearchTerm teamSearch});
}

/// @nodoc
class _$SearchCopyWithImpl<$Res> implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._value, this._then);

  final Search _value;
  // ignore: unused_field
  final $Res Function(Search) _then;

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
abstract class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) then) =
      __$SearchCopyWithImpl<$Res>;
  @override
  $Res call({int position, SearchTerm teamSearch});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> extends _$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(_Search _value, $Res Function(_Search) _then)
      : super(_value, (v) => _then(v as _Search));

  @override
  _Search get _value => super._value as _Search;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_Search(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchTerm,
    ));
  }
}

/// @nodoc
class _$_Search extends _Search {
  _$_Search({@required this.position, @required this.teamSearch})
      : assert(position != null),
        assert(teamSearch != null),
        super._();

  @override
  final int position;
  @override
  final SearchTerm teamSearch;

  @override
  String toString() {
    return 'Search(position: $position, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Search &&
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
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);
}

abstract class _Search extends Search {
  _Search._() : super._();
  factory _Search({@required int position, @required SearchTerm teamSearch}) =
      _$_Search;

  @override
  int get position;
  @override
  SearchTerm get teamSearch;
  @override
  _$SearchCopyWith<_Search> get copyWith;
}
