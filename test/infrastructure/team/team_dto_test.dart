import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/infrastructure/team/team_dto.dart';

import '../../data/json_reader.dart';

void main() {
  final teamDto = TeamDto.fromJson(jsonReader('team.json'));

  group('fromJson', () {
    test(
      'Should return a valid DTO when JSON contains an integer value',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          jsonReaderToString('team.json'),
        ) as Map<String, dynamic>;
        final result = TeamDto.fromJson(jsonMap);
        expect(result, teamDto);
      },
    );
  });

  group('toJson', () {
    test('Should return a JSON containing the data', () async {
      final result = teamDto.toJson();
      final expectedJson = jsonReader('team.json');
      expect(result, expectedJson);
    });
  });
}
