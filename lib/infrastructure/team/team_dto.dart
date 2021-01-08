import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/teams/team.dart';

part 'team_dto.freezed.dart';
part 'team_dto.g.dart';

@freezed
@TeamDtoConverter()
abstract class TeamDto with _$TeamDto {
  const TeamDto._();

  factory TeamDto({
    @required int id,
    @required String name,
    @required String country,
    @required int founded,
    @required String logo,
  }) = _TeamDto;

  factory TeamDto.fromJson(Map<String, dynamic> teamJson) =>
      _$TeamDtoFromJson(teamJson);

  Team toDomain() => Team(
        id: id,
        name: name,
        country: country,
        founded: founded,
        logo: logo,
      );
}

class TeamDtoConverter implements JsonConverter<TeamDto, Map<String, dynamic>> {
  const TeamDtoConverter();

  @override
  TeamDto fromJson(Map<String, dynamic> teamJson) => TeamDto.fromJson(teamJson);

  @override
  Map<String, dynamic> toJson(TeamDto teamData) => teamData.toJson();
}
