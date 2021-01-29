import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/config_reader.dart';
import 'package:teamapp/core/errors/exceptions/server_exception.dart';
import 'package:teamapp/domain/team/team.dart';
import 'package:teamapp/infrastructure/team/team_data_source_dio.dart';
import 'package:teamapp/infrastructure/team/team_dto.dart';

import '../../data/json_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  TeamDataSourceDio dataSource;
  MockDio mockDio;
  const teamSearch = 'São Paulo';
  final teamJson = jsonReaderToString('team_response.json');
  final teamJsonNotFound = jsonReaderToString('team_response_not_found.json');
  final teamDetails = TeamDto.fromJson(jsonReader('team.json')).toDomain();

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await ConfigReader.initialize();
    mockDio = MockDio();
    dataSource = TeamDataSourceDio(client: mockDio);
  });

  void setMockDio200() {
    when(mockDio.get(
      any,
      queryParameters: anyNamed('queryParameters'),
      options: anyNamed('options'),
    )).thenAnswer(
      (_) async => Response<String>(
        data: teamJson,
        statusCode: 200,
      ),
    );
  }

  void setMockDio200NotFound() {
    when(mockDio.get(
      any,
      queryParameters: anyNamed('queryParameters'),
      options: anyNamed('options'),
    )).thenAnswer(
      (_) async => Response<String>(
        data: teamJsonNotFound,
        statusCode: 200,
      ),
    );
  }

  test(
    'Should return team data when the response code is 200 (success)',
    () async {
      setMockDio200();
      final result = await dataSource.getDetails(teamSearch);
      expect(result, equals(teamDetails));
    },
  );

  test(
    '''Should return the empty data when the response code is 200 (success),
    but the team searched was not found''',
    () async {
      setMockDio200NotFound();
      final result = await dataSource.getDetails(teamSearch);
      expect(result, equals(Team.empty()));
    },
  );

  test(
    'Should return a ServerException when the response code is not 200',
    () async {
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenAnswer(
        (_) async => Response<String>(
          data: 'Response error',
          statusCode: 404,
        ),
      );
      final call = dataSource.getDetails;
      expect(
        () => call(teamSearch),
        throwsA(const TypeMatcher<ServerException>()),
      );
    },
  );
}
