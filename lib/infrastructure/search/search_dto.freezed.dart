// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SearchDto _$SearchDtoFromJson(Map<String, dynamic> json) {
  return _SearchDto.fromJson(json);
}

/// @nodoc
class _$SearchDtoTearOff {
  const _$SearchDtoTearOff();

// ignore: unused_element
  _SearchDto call({@required int position, @required String teamSearch}) {
    return _SearchDto(
      position: position,
      teamSearch: teamSearch,
    );
  }

// ignore: unused_element
  SearchDto fromJson(Map<String, Object> json) {
    return SearchDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SearchDto = _$SearchDtoTearOff();

/// @nodoc
mixin _$SearchDto {
  int get position;
  String get teamSearch;

  Map<String, dynamic> toJson();
  $SearchDtoCopyWith<SearchDto> get copyWith;
}

/// @nodoc
abstract class $SearchDtoCopyWith<$Res> {
  factory $SearchDtoCopyWith(SearchDto value, $Res Function(SearchDto) then) =
      _$SearchDtoCopyWithImpl<$Res>;
  $Res call({int position, String teamSearch});
}

/// @nodoc
class _$SearchDtoCopyWithImpl<$Res> implements $SearchDtoCopyWith<$Res> {
  _$SearchDtoCopyWithImpl(this._value, this._then);

  final SearchDto _value;
  // ignore: unused_field
  final $Res Function(SearchDto) _then;

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
abstract class _$SearchDtoCopyWith<$Res> implements $SearchDtoCopyWith<$Res> {
  factory _$SearchDtoCopyWith(
          _SearchDto value, $Res Function(_SearchDto) then) =
      __$SearchDtoCopyWithImpl<$Res>;
  @override
  $Res call({int position, String teamSearch});
}

/// @nodoc
class __$SearchDtoCopyWithImpl<$Res> extends _$SearchDtoCopyWithImpl<$Res>
    implements _$SearchDtoCopyWith<$Res> {
  __$SearchDtoCopyWithImpl(_SearchDto _value, $Res Function(_SearchDto) _then)
      : super(_value, (v) => _then(v as _SearchDto));

  @override
  _SearchDto get _value => super._value as _SearchDto;

  @override
  $Res call({
    Object position = freezed,
    Object teamSearch = freezed,
  }) {
    return _then(_SearchDto(
      position: position == freezed ? _value.position : position as int,
      teamSearch:
          teamSearch == freezed ? _value.teamSearch : teamSearch as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchDto extends _SearchDto {
  _$_SearchDto({@required this.position, @required this.teamSearch})
      : assert(position != null),
        assert(teamSearch != null),
        super._();

  factory _$_SearchDto.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchDtoFromJson(json);

  @override
  final int position;
  @override
  final String teamSearch;

  @override
  String toString() {
    return 'SearchDto(position: $position, teamSearch: $teamSearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchDto &&
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
  _$SearchDtoCopyWith<_SearchDto> get copyWith =>
      __$SearchDtoCopyWithImpl<_SearchDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchDtoToJson(this);
  }
}

abstract class _SearchDto extends SearchDto {
  _SearchDto._() : super._();
  factory _SearchDto({@required int position, @required String teamSearch}) =
      _$_SearchDto;

  factory _SearchDto.fromJson(Map<String, dynamic> json) =
      _$_SearchDto.fromJson;

  @override
  int get position;
  @override
  String get teamSearch;
  @override
  _$SearchDtoCopyWith<_SearchDto> get copyWith;
}
