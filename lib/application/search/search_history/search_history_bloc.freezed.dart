// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchHistoryEventTearOff {
  const _$SearchHistoryEventTearOff();

// ignore: unused_element
  _List list() {
    return const _List();
  }

// ignore: unused_element
  _Filter filter(KtList<Search> searchHistory, String teamSearch) {
    return _Filter(
      searchHistory,
      teamSearch,
    );
  }

// ignore: unused_element
  _Insert insert(KtList<Search> searchHistory, String teamSearch) {
    return _Insert(
      searchHistory,
      teamSearch,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchHistoryEvent = _$SearchHistoryEventTearOff();

/// @nodoc
mixin _$SearchHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult list(),
    @required TResult filter(KtList<Search> searchHistory, String teamSearch),
    @required TResult insert(KtList<Search> searchHistory, String teamSearch),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult list(),
    TResult filter(KtList<Search> searchHistory, String teamSearch),
    TResult insert(KtList<Search> searchHistory, String teamSearch),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult list(_List value),
    @required TResult filter(_Filter value),
    @required TResult insert(_Insert value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult list(_List value),
    TResult filter(_Filter value),
    TResult insert(_Insert value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SearchHistoryEventCopyWith<$Res> {
  factory $SearchHistoryEventCopyWith(
          SearchHistoryEvent value, $Res Function(SearchHistoryEvent) then) =
      _$SearchHistoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchHistoryEventCopyWithImpl<$Res>
    implements $SearchHistoryEventCopyWith<$Res> {
  _$SearchHistoryEventCopyWithImpl(this._value, this._then);

  final SearchHistoryEvent _value;
  // ignore: unused_field
  final $Res Function(SearchHistoryEvent) _then;
}

/// @nodoc
abstract class _$ListCopyWith<$Res> {
  factory _$ListCopyWith(_List value, $Res Function(_List) then) =
      __$ListCopyWithImpl<$Res>;
}

/// @nodoc
class __$ListCopyWithImpl<$Res> extends _$SearchHistoryEventCopyWithImpl<$Res>
    implements _$ListCopyWith<$Res> {
  __$ListCopyWithImpl(_List _value, $Res Function(_List) _then)
      : super(_value, (v) => _then(v as _List));

  @override
  _List get _value => super._value as _List;
}

/// @nodoc
class _$_List implements _List {
  const _$_List();

  @override
  String toString() {
    return 'SearchHistoryEvent.list()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _List);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult list(),
    @required TResult filter(KtList<Search> searchHistory, String teamSearch),
    @required TResult insert(KtList<Search> searchHistory, String teamSearch),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return list();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult list(),
    TResult filter(KtList<Search> searchHistory, String teamSearch),
    TResult insert(KtList<Search> searchHistory, String teamSearch),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (list != null) {
      return list();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult list(_List value),
    @required TResult filter(_Filter value),
    @required TResult insert(_Insert value),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult list(_List value),
    TResult filter(_Filter value),
    TResult insert(_Insert value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (list != null) {
      return list(this);
    }
    return orElse();
  }
}

abstract class _List implements SearchHistoryEvent {
  const factory _List() = _$_List;
}

/// @nodoc
abstract class _$FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) then) =
      __$FilterCopyWithImpl<$Res>;
  $Res call({KtList<Search> searchHistory, String teamSearch});
}

/// @nodoc
class __$FilterCopyWithImpl<$Res> extends _$SearchHistoryEventCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(_Filter _value, $Res Function(_Filter) _then)
      : super(_value, (v) => _then(v as _Filter));

  @override
  _Filter get _value => super._value as _Filter;

  @override
  $Res call({
    Object searchHistory = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_Filter(
      searchHistory == freezed
          ? _value.searchHistory
          : searchHistory as KtList<Search>,
      teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
class _$_Filter implements _Filter {
  const _$_Filter(this.searchHistory, this.teamSearch)
      : assert(searchHistory != null),
        assert(teamSearch != null);

  @override
  final KtList<Search> searchHistory;
  @override
  final String teamSearch;

  @override
  String toString() {
    return 'SearchHistoryEvent.filter(searchHistory: $searchHistory, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Filter &&
            (identical(other.searchHistory, searchHistory) ||
                const DeepCollectionEquality()
                    .equals(other.searchHistory, searchHistory)) &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchHistory) ^
      const DeepCollectionEquality().hash(teamSearch);

  @override
  _$FilterCopyWith<_Filter> get copyWith =>
      __$FilterCopyWithImpl<_Filter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult list(),
    @required TResult filter(KtList<Search> searchHistory, String teamSearch),
    @required TResult insert(KtList<Search> searchHistory, String teamSearch),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return filter(searchHistory, teamSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult list(),
    TResult filter(KtList<Search> searchHistory, String teamSearch),
    TResult insert(KtList<Search> searchHistory, String teamSearch),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filter != null) {
      return filter(searchHistory, teamSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult list(_List value),
    @required TResult filter(_Filter value),
    @required TResult insert(_Insert value),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult list(_List value),
    TResult filter(_Filter value),
    TResult insert(_Insert value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class _Filter implements SearchHistoryEvent {
  const factory _Filter(KtList<Search> searchHistory, String teamSearch) =
      _$_Filter;

  KtList<Search> get searchHistory;
  String get teamSearch;
  _$FilterCopyWith<_Filter> get copyWith;
}

/// @nodoc
abstract class _$InsertCopyWith<$Res> {
  factory _$InsertCopyWith(_Insert value, $Res Function(_Insert) then) =
      __$InsertCopyWithImpl<$Res>;
  $Res call({KtList<Search> searchHistory, String teamSearch});
}

/// @nodoc
class __$InsertCopyWithImpl<$Res> extends _$SearchHistoryEventCopyWithImpl<$Res>
    implements _$InsertCopyWith<$Res> {
  __$InsertCopyWithImpl(_Insert _value, $Res Function(_Insert) _then)
      : super(_value, (v) => _then(v as _Insert));

  @override
  _Insert get _value => super._value as _Insert;

  @override
  $Res call({
    Object searchHistory = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_Insert(
      searchHistory == freezed
          ? _value.searchHistory
          : searchHistory as KtList<Search>,
      teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
class _$_Insert implements _Insert {
  const _$_Insert(this.searchHistory, this.teamSearch)
      : assert(searchHistory != null),
        assert(teamSearch != null);

  @override
  final KtList<Search> searchHistory;
  @override
  final String teamSearch;

  @override
  String toString() {
    return 'SearchHistoryEvent.insert(searchHistory: $searchHistory, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Insert &&
            (identical(other.searchHistory, searchHistory) ||
                const DeepCollectionEquality()
                    .equals(other.searchHistory, searchHistory)) &&
            (identical(other.teamSearch, teamSearch) ||
                const DeepCollectionEquality()
                    .equals(other.teamSearch, teamSearch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchHistory) ^
      const DeepCollectionEquality().hash(teamSearch);

  @override
  _$InsertCopyWith<_Insert> get copyWith =>
      __$InsertCopyWithImpl<_Insert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult list(),
    @required TResult filter(KtList<Search> searchHistory, String teamSearch),
    @required TResult insert(KtList<Search> searchHistory, String teamSearch),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return insert(searchHistory, teamSearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult list(),
    TResult filter(KtList<Search> searchHistory, String teamSearch),
    TResult insert(KtList<Search> searchHistory, String teamSearch),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insert != null) {
      return insert(searchHistory, teamSearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult list(_List value),
    @required TResult filter(_Filter value),
    @required TResult insert(_Insert value),
  }) {
    assert(list != null);
    assert(filter != null);
    assert(insert != null);
    return insert(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult list(_List value),
    TResult filter(_Filter value),
    TResult insert(_Insert value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insert != null) {
      return insert(this);
    }
    return orElse();
  }
}

abstract class _Insert implements SearchHistoryEvent {
  const factory _Insert(KtList<Search> searchHistory, String teamSearch) =
      _$_Insert;

  KtList<Search> get searchHistory;
  String get teamSearch;
  _$InsertCopyWith<_Insert> get copyWith;
}

/// @nodoc
class _$SearchHistoryStateTearOff {
  const _$SearchHistoryStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Load load() {
    return const _Load();
  }

// ignore: unused_element
  _Success success(KtList<Search> searchHistory) {
    return _Success(
      searchHistory,
    );
  }

// ignore: unused_element
  _Failure failure(SearchFailure searchFailure) {
    return _Failure(
      searchFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchHistoryState = _$SearchHistoryStateTearOff();

/// @nodoc
mixin _$SearchHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult load(),
    @required TResult success(KtList<Search> searchHistory),
    @required TResult failure(SearchFailure searchFailure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult load(),
    TResult success(KtList<Search> searchHistory),
    TResult failure(SearchFailure searchFailure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult load(_Load value),
    @required TResult success(_Success value),
    @required TResult failure(_Failure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult load(_Load value),
    TResult success(_Success value),
    TResult failure(_Failure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SearchHistoryStateCopyWith<$Res> {
  factory $SearchHistoryStateCopyWith(
          SearchHistoryState value, $Res Function(SearchHistoryState) then) =
      _$SearchHistoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchHistoryStateCopyWithImpl<$Res>
    implements $SearchHistoryStateCopyWith<$Res> {
  _$SearchHistoryStateCopyWithImpl(this._value, this._then);

  final SearchHistoryState _value;
  // ignore: unused_field
  final $Res Function(SearchHistoryState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SearchHistoryStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchHistoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult load(),
    @required TResult success(KtList<Search> searchHistory),
    @required TResult failure(SearchFailure searchFailure),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult load(),
    TResult success(KtList<Search> searchHistory),
    TResult failure(SearchFailure searchFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult load(_Load value),
    @required TResult success(_Success value),
    @required TResult failure(_Failure value),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult load(_Load value),
    TResult success(_Success value),
    TResult failure(_Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchHistoryState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$SearchHistoryStateCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(_Load _value, $Res Function(_Load) _then)
      : super(_value, (v) => _then(v as _Load));

  @override
  _Load get _value => super._value as _Load;
}

/// @nodoc
class _$_Load implements _Load {
  const _$_Load();

  @override
  String toString() {
    return 'SearchHistoryState.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult load(),
    @required TResult success(KtList<Search> searchHistory),
    @required TResult failure(SearchFailure searchFailure),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return load();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult load(),
    TResult success(KtList<Search> searchHistory),
    TResult failure(SearchFailure searchFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult load(_Load value),
    @required TResult success(_Success value),
    @required TResult failure(_Failure value),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult load(_Load value),
    TResult success(_Success value),
    TResult failure(_Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements SearchHistoryState {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({KtList<Search> searchHistory});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$SearchHistoryStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object searchHistory = freezed,
  }) {
    return _then(_Success(
      searchHistory == freezed
          ? _value.searchHistory
          : searchHistory as KtList<Search>,
    ));
  }
}

/// @nodoc
class _$_Success implements _Success {
  const _$_Success(this.searchHistory) : assert(searchHistory != null);

  @override
  final KtList<Search> searchHistory;

  @override
  String toString() {
    return 'SearchHistoryState.success(searchHistory: $searchHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.searchHistory, searchHistory) ||
                const DeepCollectionEquality()
                    .equals(other.searchHistory, searchHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchHistory);

  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult load(),
    @required TResult success(KtList<Search> searchHistory),
    @required TResult failure(SearchFailure searchFailure),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return success(searchHistory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult load(),
    TResult success(KtList<Search> searchHistory),
    TResult failure(SearchFailure searchFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(searchHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult load(_Load value),
    @required TResult success(_Success value),
    @required TResult failure(_Failure value),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult load(_Load value),
    TResult success(_Success value),
    TResult failure(_Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SearchHistoryState {
  const factory _Success(KtList<Search> searchHistory) = _$_Success;

  KtList<Search> get searchHistory;
  _$SuccessCopyWith<_Success> get copyWith;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({SearchFailure searchFailure});

  $SearchFailureCopyWith<$Res> get searchFailure;
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$SearchHistoryStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object searchFailure = freezed,
  }) {
    return _then(_Failure(
      searchFailure == freezed
          ? _value.searchFailure
          : searchFailure as SearchFailure,
    ));
  }

  @override
  $SearchFailureCopyWith<$Res> get searchFailure {
    if (_value.searchFailure == null) {
      return null;
    }
    return $SearchFailureCopyWith<$Res>(_value.searchFailure, (value) {
      return _then(_value.copyWith(searchFailure: value));
    });
  }
}

/// @nodoc
class _$_Failure implements _Failure {
  const _$_Failure(this.searchFailure) : assert(searchFailure != null);

  @override
  final SearchFailure searchFailure;

  @override
  String toString() {
    return 'SearchHistoryState.failure(searchFailure: $searchFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.searchFailure, searchFailure) ||
                const DeepCollectionEquality()
                    .equals(other.searchFailure, searchFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchFailure);

  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult load(),
    @required TResult success(KtList<Search> searchHistory),
    @required TResult failure(SearchFailure searchFailure),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return failure(searchFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult load(),
    TResult success(KtList<Search> searchHistory),
    TResult failure(SearchFailure searchFailure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(searchFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult load(_Load value),
    @required TResult success(_Success value),
    @required TResult failure(_Failure value),
  }) {
    assert(initial != null);
    assert(load != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult load(_Load value),
    TResult success(_Success value),
    TResult failure(_Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements SearchHistoryState {
  const factory _Failure(SearchFailure searchFailure) = _$_Failure;

  SearchFailure get searchFailure;
  _$FailureCopyWith<_Failure> get copyWith;
}
