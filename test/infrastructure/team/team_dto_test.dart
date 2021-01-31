import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/domain/team/team.dart';
import 'package:teamapp/infrastructure/team/team_dto.dart';

import '../../data/json_reader.dart';

void main() {
  const teamJsonFile = 'team/team.json';
  final teamDto = TeamDto.fromJson(jsonReader(teamJsonFile));

  group('fromJson\n', () {
    test(
      '\tShould return a valid DTO when JSON contains an integer value',
      () {
        final Map<String, dynamic> jsonMap = json.decode(
          jsonReaderToString(teamJsonFile),
        ) as Map<String, dynamic>;
        final result = TeamDto.fromJson(jsonMap);
        expect(result, equals(teamDto));
      },
    );
  });

  group('toJson\n', () {
    test(
      '\tShould return a JSON containing the data',
      () {
        final result = teamDto.toJson();
        final expectedJson = jsonReader(teamJsonFile);
        expect(result, equals(expectedJson));
      },
    );
  });

  group(
    'toDomain\n',
    () {
      test(
        '\tShould return a domain data',
        () {
          final domain = Team(
            id: 126,
            name: 'Sao Paulo',
            country: 'Brazil',
            founded: 1930,
            logo: "https://media.api-sports.io/football/teams/126.png",
          );
          final result = teamDto.toDomain();
          expect(result, equals(domain));
        },
      );
    },
  );
}
