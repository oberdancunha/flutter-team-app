// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SearchHistoryDto _$SearchHistoryDtoFromJson(Map<String, dynamic> json) {
  return _SearchHistoryDto.fromJson(json);
}

/// @nodoc
class _$SearchHistoryDtoTearOff {
  const _$SearchHistoryDtoTearOff();

// ignore: unused_element
  _SearchHistoryDto call(
      {@required int position, @required String teamSearch}) {
    return _SearchHistoryDto(
      position: position,
      teamSearch: teamSearch,
    );
  }

// ignore: unused_element
  SearchHistoryDto fromJson(Map<String, Object> json) {
    return SearchHistoryDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SearchHistoryDto = _$SearchHistoryDtoTearOff();

/// @nodoc
mixin _$SearchHistoryDto {
  int get position;
  String get teamSearch;

  Map<String, dynamic> toJson();
  $SearchHistoryDtoCopyWith<SearchHistoryDto> get copyWith;
}

/// @nodoc
abstract class $SearchHistoryDtoCopyWith<$Res> {
  factory $SearchHistoryDtoCopyWith(
          SearchHistoryDto value, $Res Function(SearchHistoryDto) then) =
      _$SearchHistoryDtoCopyWithImpl<$Res>;
  $Res call({int position, String teamSearch});
}

/// @nodoc
class _$SearchHistoryDtoCopyWithImpl<$Res>
    implements $SearchHistoryDtoCopyWith<$Res> {
  _$SearchHistoryDtoCopyWithImpl(this._value, this._then);

  final SearchHistoryDto _value;
  // ignore: unused_field
  final $Res Function(SearchHistoryDto) _then;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchHistoryDtoCopyWith<$Res>
    implements $SearchHistoryDtoCopyWith<$Res> {
  factory _$SearchHistoryDtoCopyWith(
          _SearchHistoryDto value, $Res Function(_SearchHistoryDto) then) =
      __$SearchHistoryDtoCopyWithImpl<$Res>;
  @override
  $Res call({int position, String teamSearch});
}

/// @nodoc
class __$SearchHistoryDtoCopyWithImpl<$Res>
    extends _$SearchHistoryDtoCopyWithImpl<$Res>
    implements _$SearchHistoryDtoCopyWith<$Res> {
  __$SearchHistoryDtoCopyWithImpl(
      _SearchHistoryDto _value, $Res Function(_SearchHistoryDto) _then)
      : super(_value, (v) => _then(v as _SearchHistoryDto));

  @override
  _SearchHistoryDto get _value => super._value as _SearchHistoryDto;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_SearchHistoryDto(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchHistoryDto extends _SearchHistoryDto {
  _$_SearchHistoryDto({@required this.position, @required this.teamSearch})
      : assert(position != null),
        assert(teamSearch != null),
        super._();

  factory _$_SearchHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchHistoryDtoFromJson(json);

  @override
  final int position;
  @override
  final String teamSearch;

  @override
  String toString() {
    return 'SearchHistoryDto(position: $position, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchHistoryDto &&
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
  _$SearchHistoryDtoCopyWith<_SearchHistoryDto> get copyWith =>
      __$SearchHistoryDtoCopyWithImpl<_SearchHistoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchHistoryDtoToJson(this);
  }
}

abstract class _SearchHistoryDto extends SearchHistoryDto {
  _SearchHistoryDto._() : super._();
  factory _SearchHistoryDto(
      {@required int position,
      @required String teamSearch}) = _$_SearchHistoryDto;

  factory _SearchHistoryDto.fromJson(Map<String, dynamic> json) =
      _$_SearchHistoryDto.fromJson;

  @override
  int get position;
  @override
  String get teamSearch;
  @override
  _$SearchHistoryDtoCopyWith<_SearchHistoryDto> get copyWith;
}
