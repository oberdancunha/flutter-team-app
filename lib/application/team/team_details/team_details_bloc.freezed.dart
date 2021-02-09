// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'team_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TeamDetailsEventTearOff {
  const _$TeamDetailsEventTearOff();

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
const $TeamDetailsEvent = _$TeamDetailsEventTearOff();

/// @nodoc
mixin _$TeamDetailsEvent {
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

  $TeamDetailsEventCopyWith<TeamDetailsEvent> get copyWith;
}

/// @nodoc
abstract class $TeamDetailsEventCopyWith<$Res> {
  factory $TeamDetailsEventCopyWith(
          TeamDetailsEvent value, $Res Function(TeamDetailsEvent) then) =
      _$TeamDetailsEventCopyWithImpl<$Res>;
  $Res call({String teamSearch});
}

/// @nodoc
class _$TeamDetailsEventCopyWithImpl<$Res>
    implements $TeamDetailsEventCopyWith<$Res> {
  _$TeamDetailsEventCopyWithImpl(this._value, this._then);

  final TeamDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(TeamDetailsEvent) _then;

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
    implements $TeamDetailsEventCopyWith<$Res> {
  factory _$ChangeTeamCopyWith(
          _ChangeTeam value, $Res Function(_ChangeTeam) then) =
      __$ChangeTeamCopyWithImpl<$Res>;
  @override
  $Res call({String teamSearch});
}

/// @nodoc
class __$ChangeTeamCopyWithImpl<$Res>
    extends _$TeamDetailsEventCopyWithImpl<$Res>
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
    return 'TeamDetailsEvent.changeTeam(teamSearch: $teamSearch)';
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

abstract class _ChangeTeam implements TeamDetailsEvent {
  const factory _ChangeTeam(String teamSearch) = _$_ChangeTeam;

  @override
  String get teamSearch;
  @override
  _$ChangeTeamCopyWith<_ChangeTeam> get copyWith;
}

/// @nodoc
abstract class _$SearchCopyWith<$Res>
    implements $TeamDetailsEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) then) =
      __$SearchCopyWithImpl<$Res>;
  @override
  $Res call({String teamSearch});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> extends _$TeamDetailsEventCopyWithImpl<$Res>
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
    return 'TeamDetailsEvent.search(teamSearch: $teamSearch)';
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

abstract class _Search implements TeamDetailsEvent {
  const factory _Search(String teamSearch) = _$_Search;

  @override
  String get teamSearch;
  @override
  _$SearchCopyWith<_Search> get copyWith;
}

/// @nodoc
class _$TeamDetailsStateTearOff {
  const _$TeamDetailsStateTearOff();

// ignore: unused_element
  _TeamDetailsState call(
      {@required SearchTerm teamSearch,
      @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      @required bool isSearching}) {
    return _TeamDetailsState(
      teamSearch: teamSearch,
      teamFailureOrSuccess: teamFailureOrSuccess,
      isSearching: isSearching,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TeamDetailsState = _$TeamDetailsStateTearOff();

/// @nodoc
mixin _$TeamDetailsState {
  SearchTerm get teamSearch;
  Option<Either<TeamFailure, Team>> get teamFailureOrSuccess;
  bool get isSearching;

  $TeamDetailsStateCopyWith<TeamDetailsState> get copyWith;
}

/// @nodoc
abstract class $TeamDetailsStateCopyWith<$Res> {
  factory $TeamDetailsStateCopyWith(
          TeamDetailsState value, $Res Function(TeamDetailsState) then) =
      _$TeamDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {SearchTerm teamSearch,
      Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      bool isSearching});
}

/// @nodoc
class _$TeamDetailsStateCopyWithImpl<$Res>
    implements $TeamDetailsStateCopyWith<$Res> {
  _$TeamDetailsStateCopyWithImpl(this._value, this._then);

  final TeamDetailsState _value;
  // ignore: unused_field
  final $Res Function(TeamDetailsState) _then;

  @override
  $Res call({
    Object teamSearch = freezed,
    Object teamFailureOrSuccess = freezed,
    Object isSearching = freezed,
  }) {
    return _then(_value.copyWith(
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchTerm,
      teamFailureOrSuccess: teamFailureOrSuccess == freezed
          ? _value.teamFailureOrSuccess
          : teamFailureOrSuccess as Option<Either<TeamFailure, Team>>,
      isSearching:
          isSearching == freezed ? _value.isSearching : isSearching as bool,
    ));
  }
}

/// @nodoc
abstract class _$TeamDetailsStateCopyWith<$Res>
    implements $TeamDetailsStateCopyWith<$Res> {
  factory _$TeamDetailsStateCopyWith(
          _TeamDetailsState value, $Res Function(_TeamDetailsState) then) =
      __$TeamDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SearchTerm teamSearch,
      Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      bool isSearching});
}

/// @nodoc
class __$TeamDetailsStateCopyWithImpl<$Res>
    extends _$TeamDetailsStateCopyWithImpl<$Res>
    implements _$TeamDetailsStateCopyWith<$Res> {
  __$TeamDetailsStateCopyWithImpl(
      _TeamDetailsState _value, $Res Function(_TeamDetailsState) _then)
      : super(_value, (v) => _then(v as _TeamDetailsState));

  @override
  _TeamDetailsState get _value => super._value as _TeamDetailsState;

  @override
  $Res call({
    Object teamSearch = freezed,
    Object teamFailureOrSuccess = freezed,
    Object isSearching = freezed,
  }) {
    return _then(_TeamDetailsState(
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as SearchTerm,
      teamFailureOrSuccess: teamFailureOrSuccess == freezed
          ? _value.teamFailureOrSuccess
          : teamFailureOrSuccess as Option<Either<TeamFailure, Team>>,
      isSearching:
          isSearching == freezed ? _value.isSearching : isSearching as bool,
    ));
  }
}

/// @nodoc
class _$_TeamDetailsState implements _TeamDetailsState {
  const _$_TeamDetailsState(
      {@required this.teamSearch,
      @required this.teamFailureOrSuccess,
      @required this.isSearching})
      : assert(teamSearch != null),
        assert(teamFailureOrSuccess != null),
        assert(isSearching != null);

  @override
  final SearchTerm teamSearch;
  @override
  final Option<Either<TeamFailure, Team>> teamFailureOrSuccess;
  @override
  final bool isSearching;

  @override
  String toString() {
    return 'TeamDetailsState(teamSearch: $teamSearch, teamFailureOrSuccess: $teamFailureOrSuccess, isSearching: $isSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamDetailsState &&
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
  _$TeamDetailsStateCopyWith<_TeamDetailsState> get copyWith =>
      __$TeamDetailsStateCopyWithImpl<_TeamDetailsState>(this, _$identity);
}

abstract class _TeamDetailsState implements TeamDetailsState {
  const factory _TeamDetailsState(
      {@required SearchTerm teamSearch,
      @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
      @required bool isSearching}) = _$_TeamDetailsState;

  @override
  SearchTerm get teamSearch;
  @override
  Option<Either<TeamFailure, Team>> get teamFailureOrSuccess;
  @override
  bool get isSearching;
  @override
  _$TeamDetailsStateCopyWith<_TeamDetailsState> get copyWith;
}
