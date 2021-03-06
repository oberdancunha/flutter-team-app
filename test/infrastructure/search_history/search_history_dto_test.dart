import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/domain/search_history/search_history.dart';
import 'package:teamapp/domain/team/value_objects.dart';
import 'package:teamapp/infrastructure/search_history/search_history_dto.dart';

import '../../data/json_reader.dart';

void main() {
  const searchHistoryJsonFile = 'search/search.json';
  final searchJson = jsonReader(searchHistoryJsonFile);
  final searchHistoryDto = SearchHistoryDto.fromJson(searchJson);

  group('fromJson\n', () {
    test(
      '\tShould return a valid DTO when JSON contains an integer value',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          jsonReaderToString(searchHistoryJsonFile),
        ) as Map<String, dynamic>;
        final result = SearchHistoryDto.fromJson(jsonMap);
        expect(result, searchHistoryDto);
      },
    );
  });

  group(
    'toJson\n',
    () {
      test(
        '\tShould return a JSON containing the data',
        () {
          final result = searchHistoryDto.toJson();
          final expectedJson = jsonReader(searchHistoryJsonFile);
          expect(result, equals(expectedJson));
        },
      );
    },
  );

  group(
    'toDomain\n',
    () {
      test(
        '\tShould return a domain data',
        () {
          final domain = SearchHistory(
            position: 0,
            teamSearch: SearchTerm("Sao Paulo"),
          );
          final result = searchHistoryDto.toDomain();
          expect(result, equals(domain));
        },
      );
    },
  );
}
