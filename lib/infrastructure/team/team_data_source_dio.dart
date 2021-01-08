import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../config_reader.dart';
import '../../core/errors/exceptions/server_exception.dart';
import '../../domain/teams/i_team_data_source.dart';
import '../../domain/teams/team.dart';
import 'team_dto.dart';

class TeamDataSourceDio implements ITeamDataSource {
  final Dio client;

  TeamDataSourceDio({@required this.client});

  @override
  Future<Team> getDetails(String teamSearch) async {
    try {
      final Response<String> response = await client.get(
        'https://${ConfigReader.getApiHost()}/teams',
        queryParameters: {'name': teamSearch},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-rapidapi-key': ConfigReader.getApiKey(),
            'x-rapidapi-host': ConfigReader.getApiHost(),
            'useQueryString': true,
          },
        ),
      );
      if (response?.statusCode == 200) {
        final data = json.decode(response.data) as Map<String, dynamic>;
        if (data['results'] == 0) {
          return Team.empty();
        } else {
          return TeamDto.fromJson(
            data['response'][0]['team'] as Map<String, dynamic>,
          ).toDomain();
        }
      } else {
        throw DioError();
      }
    } on DioError {
      throw ServerException();
    }
  }
}
