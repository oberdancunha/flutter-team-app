import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/domain/search/search.dart';
import 'package:teamapp/domain/search/value_objects.dart';
import 'package:teamapp/infrastructure/search/search_dto.dart';

import '../../data/json_reader.dart';

void main() {
  const searchHistoryJsonFile = 'search/search.json';
  final searchJson = jsonReader(searchHistoryJsonFile);
  final searchDto = SearchDto.fromJson(searchJson);

  group('fromJson\n', () {
    test(
      '\tShould return a valid DTO when JSON contains an integer value',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          jsonReaderToString(searchHistoryJsonFile),
        ) as Map<String, dynamic>;
        final result = SearchDto.fromJson(jsonMap);
        expect(result, searchDto);
      },
    );
  });

  group(
    'toJson\n',
    () {
      test(
        '\tShould return a JSON containing the data',
        () {
          final result = searchDto.toJson();
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
          final domain = Search(
            position: 0,
            term: SearchTerm("Sao Paulo"),
          );
          final result = searchDto.toDomain();
          expect(result, equals(domain));
        },
      );
    },
  );
}
