// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

// ignore: unused_element
  _Team call(
      {@required int id,
      @required String name,
      @required String country,
      @required int founded,
      @required String logo}) {
    return _Team(
      id: id,
      name: name,
      country: country,
      founded: founded,
      logo: logo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  int get id;
  String get name;
  String get country;
  int get founded;
  String get logo;

  $TeamCopyWith<Team> get copyWith;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call({int id, String name, String country, int founded, String logo});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object country = freezed,
    Object founded = freezed,
    Object logo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      country: country == freezed ? _value.country : country as String,
      founded: founded == freezed ? _value.founded : founded as int,
      logo: logo == freezed ? _value.logo : logo as String,
    ));
  }
}

/// @nodoc
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String country, int founded, String logo});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object country = freezed,
    Object founded = freezed,
    Object logo = freezed,
  }) {
    return _then(_Team(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      country: country == freezed ? _value.country : country as String,
      founded: founded == freezed ? _value.founded : founded as int,
      logo: logo == freezed ? _value.logo : logo as String,
    ));
  }
}

/// @nodoc
class _$_Team extends _Team {
  _$_Team(
      {@required this.id,
      @required this.name,
      @required this.country,
      @required this.founded,
      @required this.logo})
      : assert(id != null),
        assert(name != null),
        assert(country != null),
        assert(founded != null),
        assert(logo != null),
        super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String country;
  @override
  final int founded;
  @override
  final String logo;

  @override
  String toString() {
    return 'Team(id: $id, name: $name, country: $country, founded: $founded, logo: $logo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Team &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.founded, founded) ||
                const DeepCollectionEquality()
                    .equals(other.founded, founded)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(founded) ^
      const DeepCollectionEquality().hash(logo);

  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);
}

abstract class _Team extends Team {
  _Team._() : super._();
  factory _Team(
      {@required int id,
      @required String name,
      @required String country,
      @required int founded,
      @required String logo}) = _$_Team;

  @override
  int get id;
  @override
  String get name;
  @override
  String get country;
  @override
  int get founded;
  @override
  String get logo;
  @override
  _$TeamCopyWith<_Team> get copyWith;
}
