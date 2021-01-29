// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'team_form_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TeamFormSearchEventTearOff {
  const _$TeamFormSearchEventTearOff();

// ignore: unused_element
  _ChangeTeam changeTeam(String teamSearch) {
    return _ChangeTeam(
      teamSearch,
    );
  }

// ignore: unused_element
  _Search search(String teamSearch) {
    return _Search(
      teamSearch,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TeamFormSearchEvent = _$TeamFormSearchEventTearOff();

/// @nodoc
mixin _$TeamFormSearchEvent {
  String get teamSearch;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeTeam(String teamSearch),
    @required TResult search(String teamSearch),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeTeam(String teamSearch),
    TResult search(String teamSearch),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeTeam(_ChangeTeam value),
    @required TResult search(_Search value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeTeam(_ChangeTeam value),
    TResult search(_Search value),
    @required TResult orElse(),
  });

  $TeamFormSearchEventCopyWith<TeamFormSearchEvent> get copyWith;
}

/// @nodoc
abstract class $TeamFormSearchEventCopyWith<$Res> {
  factory $TeamFormSearchEventCopyWith(
          TeamFormSearchEvent value, $Res Function(TeamFormSearchEvent) then) =
      _$TeamFormSearchEventCopyWithImpl<$Res>;
  $Res call({String teamSearch});
}

/// @nodoc
class _$TeamFormSearchEventCopyWithImpl<$Res>
    implements $TeamFormSearchEventCopyWith<$Res> {
  _$TeamFormSearchEventCopyWithImpl(this._value, this._then);

  final TeamFormSearchEvent _value;
  // ignore: unused_field
  final $Res Function(TeamFormSearchEvent) _then;

  @override
  $Res call({
    Object teamSearch = freezed,
  }) {
    return _then(_value.copyWith(
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
abstract class _$ChangeTeamCopyWith<$Res>
    implements $TeamFormSearchEventCopyWith<$Res> {
  factory _$ChangeTeamCopyWith(
          _ChangeTeam value, $Res Function(_ChangeTeam) then) =
      __$ChangeTeamCopyWithImpl<$Res>;
  @override
  $Res call({String teamSearch});
}

/// @nodoc
class __$ChangeTeamCopyWithImpl<$Res>
    extends _$TeamFormSearchEventCopyWithImpl<$Res>
    implements _$ChangeTeamCopyWith<$Res> {
  __$ChangeTeamCopyWithImpl(
      _ChangeTeam _value, $Res Function(_ChangeTeam) _then)
      : super(_value, (v) => _then(v as _ChangeTeam));

  @override
  _ChangeTeam get _value => super._value as _ChangeTeam;

  @override
  $Res call({
    Object teamSearch = freezed,
  }) {
    return _then(_ChangeTeam(
      teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
class _$_ChangeTeam implements _ChangeTeam {
  const _$_ChangeTeam(this.teamSearch) : assert(teamSearch != null);

  @override
  final String teamSearch;

  @override
  String toString() {
    return 'TeamFormSearchEvent.changeTeam(teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeTeam &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(teamSearch);

  @override
  _$ChangeTeamCopyWith<_ChangeTeam> get copyWith =>
      __$ChangeTeamCopyWithImpl<_ChangeTeam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeTeam(String teamSearch),
    @required TResult search(String teamSearch),
  }) {
    assert(changeTeam != null);
    assert(search != null);
    return changeTeam(teamSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeTeam(String teamSearch),
    TResult search(String teamSearch),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeTeam != null) {
      return changeTeam(teamSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeTeam(_ChangeTeam value),
    @required TResult search(_Search value),
  }) {
    assert(changeTeam != null);
    assert(search != null);
    return changeTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeTeam(_ChangeTeam value),
    TResult search(_Search value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeTeam != null) {
      return changeTeam(this);
    }
    return orElse();
  }
}

abstract class _ChangeTeam implements TeamFormSearchEvent {
  const factory _ChangeTeam(String teamSearch) = _$_ChangeTeam;

  @override
  String get teamSearch;
  @override
  _$ChangeTeamCopyWith<_ChangeTeam> get copyWith;
}

/// @nodoc
abstract class _$SearchCopyWith<$Res>
    implements $TeamFormSearchEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) then) =
      __$SearchCopyWithImpl<$Res>;
  @override
  $Res call({String teamSearch});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res>
    extends _$TeamFormSearchEventCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(_Search _value, $Res Function(_Search) _then)
      : super(_value, (v) => _then(v as _Search));

  @override
  _Search get _value => super._value as _Search;

  @override
  $Res call({
    Object teamSearch = freezed,
  }) {
    return _then(_Search(
      teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
class _$_Search implements _Search {
  const _$_Search(this.teamSearch) : assert(teamSearch != null);

  @override
  final String teamSearch;

  @override
  String toString() {
    return 'TeamFormSearchEvent.search(teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Search &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(teamSearch);

  @override
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeTeam(String teamSearch),
    @required TResult search(String teamSearch),
  }) {
    assert(changeTeam != null);
    assert(search != null);
    return search(teamSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeTeam(String teamSearch),
    TResult search(String teamSearch),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(teamSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeTeam(_ChangeTeam value),
    @required TResult search(_Search value),
  }) {
    assert(changeTeam != null);
    assert(search != null);
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeTeam(_ChangeTeam value),
    TResult search(_Search value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements TeamFormSearchEvent {
  const factory _Search(String teamSearch) = _$_Search;

  @override
  String get teamSearch;
  @override
  _$SearchCopyWith<_Search> get copyWith;
}

/// @nodoc
class _$TeamFormSearchStateTearOff {
  const _$TeamFormSearchStateTearOff();

// ignore: unused_element
  _TeamFormSearchState call(
      {@required SearchText teamSearch,
      @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      @required bool isSearching}) {
    return _TeamFormSearchState(
      teamSearch: teamSearch,
      teamFailureOrSuccess: teamFailureOrSuccess,
      isSearching: isSearching,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TeamFormSearchState = _$TeamFormSearchStateTearOff();

/// @nodoc
mixin _$TeamFormSearchState {
  SearchText get teamSearch;
  Option<Either<TeamFailure, Team>> get teamFailureOrSuccess;
  bool get isSearching;

  $TeamFormSearchStateCopyWith<TeamFormSearchState> get copyWith;
}

/// @nodoc
abstract class $TeamFormSearchStateCopyWith<$Res> {
  factory $TeamFormSearchStateCopyWith(
          TeamFormSearchState value, $Res Function(TeamFormSearchState) then) =
      _$TeamFormSearchStateCopyWithImpl<$Res>;
  $Res call(
      {SearchText teamSearch,
      Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      bool isSearching});
}

/// @nodoc
class _$TeamFormSearchStateCopyWithImpl<$Res>
    implements $TeamFormSearchStateCopyWith<$Res> {
  _$TeamFormSearchStateCopyWithImpl(this._value, this._then);

  final TeamFormSearchState _value;
  // ignore: unused_field
  final $Res Function(TeamFormSearchState) _then;

  @override
  $Res call({
    Object teamSearch = freezed,
    Object teamFailureOrSuccess = freezed,
    Object isSearching = freezed,
  }) {
    return _then(_value.copyWith(
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchText,
      teamFailureOrSuccess: teamFailureOrSuccess == freezed
          ? _value.teamFailureOrSuccess
          : teamFailureOrSuccess as Option<Either<TeamFailure, Team>>,
      isSearching:
          isSearching == freezed ? _value.isSearching : isSearching as bool,
    ));
  }
}

/// @nodoc
abstract class _$TeamFormSearchStateCopyWith<$Res>
    implements $TeamFormSearchStateCopyWith<$Res> {
  factory _$TeamFormSearchStateCopyWith(_TeamFormSearchState value,
          $Res Function(_TeamFormSearchState) then) =
      __$TeamFormSearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SearchText teamSearch,
      Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      bool isSearching});
}

/// @nodoc
class __$TeamFormSearchStateCopyWithImpl<$Res>
    extends _$TeamFormSearchStateCopyWithImpl<$Res>
    implements _$TeamFormSearchStateCopyWith<$Res> {
  __$TeamFormSearchStateCopyWithImpl(
      _TeamFormSearchState _value, $Res Function(_TeamFormSearchState) _then)
      : super(_value, (v) => _then(v as _TeamFormSearchState));

  @override
  _TeamFormSearchState get _value => super._value as _TeamFormSearchState;

  @override
  $Res call({
    Object teamSearch = freezed,
    Object teamFailureOrSuccess = freezed,
    Object isSearching = freezed,
  }) {
    return _then(_TeamFormSearchState(
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchText,
      teamFailureOrSuccess: teamFailureOrSuccess == freezed
          ? _value.teamFailureOrSuccess
          : teamFailureOrSuccess as Option<Either<TeamFailure, Team>>,
      isSearching:
          isSearching == freezed ? _value.isSearching : isSearching as bool,
    ));
  }
}

/// @nodoc
class _$_TeamFormSearchState implements _TeamFormSearchState {
  const _$_TeamFormSearchState(
      {@required this.teamSearch,
      @required this.teamFailureOrSuccess,
      @required this.isSearching})
      : assert(teamSearch != null),
        assert(teamFailureOrSuccess != null),
        assert(isSearching != null);

  @override
  final SearchText teamSearch;
  @override
  final Option<Either<TeamFailure, Team>> teamFailureOrSuccess;
  @override
  final bool isSearching;

  @override
  String toString() {
    return 'TeamFormSearchState(teamSearch: $teamSearch, teamFailureOrSuccess: $teamFailureOrSuccess, isSearching: $isSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamFormSearchState &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)) &&
            (identical(other.teamFailureOrSuccess, teamFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.teamFailureOrSuccess, teamFailureOrSuccess)) &&
            (identical(other.isSearching, isSearching) ||
                const DeepCollectionEquality()
                    .equals(other.isSearching, isSearching)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(teamSearch) ^
      const DeepCollectionEquality().hash(teamFailureOrSuccess) ^
      const DeepCollectionEquality().hash(isSearching);

  @override
  _$TeamFormSearchStateCopyWith<_TeamFormSearchState> get copyWith =>
      __$TeamFormSearchStateCopyWithImpl<_TeamFormSearchState>(
          this, _$identity);
}

abstract class _TeamFormSearchState implements TeamFormSearchState {
  const factory _TeamFormSearchState(
      {@required SearchText teamSearch,
      @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      @required bool isSearching}) = _$_TeamFormSearchState;

  @override
  SearchText get teamSearch;
  @override
  Option<Either<TeamFailure, Team>> get teamFailureOrSuccess;
  @override
  bool get isSearching;
  @override
  _$TeamFormSearchStateCopyWith<_TeamFormSearchState> get copyWith;
}
