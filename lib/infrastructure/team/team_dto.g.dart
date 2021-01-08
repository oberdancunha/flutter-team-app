// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamDto _$_$_TeamDtoFromJson(Map<String, dynamic> json) {
  return _$_TeamDto(
    id: json['id'] as int,
    name: json['name'] as String,
    country: json['country'] as String,
    founded: json['founded'] as int,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$_$_TeamDtoToJson(_$_TeamDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'founded': instance.founded,
      'logo': instance.logo,
    };
