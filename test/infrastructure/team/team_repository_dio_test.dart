import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/core/errors/exceptions/server_exception.dart';
import 'package:teamapp/core/network/i_network_info.dart';
import 'package:teamapp/domain/team/i_team_data_source.dart';
import 'package:teamapp/domain/team/team_failures.dart';
import 'package:teamapp/infrastructure/team/team_dto.dart';
import 'package:teamapp/infrastructure/team/team_repository.dart';

import '../../data/json_reader.dart';

class MockNetworkInfo extends Mock implements INetworkInfo {}

class MockTeamDataSource extends Mock implements ITeamDataSource {}

void main() {
  TeamRepository repository;
  MockNetworkInfo mockNetworkInfo;
  MockTeamDataSource mockTeamDataSource;
  String teamSearch;
  final teamDetails = TeamDto.fromJson(jsonReader('team/team.json')).toDomain();

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockTeamDataSource = MockTeamDataSource();
    repository = TeamRepository(
      teamDataSource: mockTeamDataSource,
      networkInfo: mockNetworkInfo,
    );
    teamSearch = 'São Paulo';
  });

  test('Should check if the device is online', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    repository.getDetails(teamSearch);
    verify(mockNetworkInfo.isConnected);
  });

  test('Should check if the device is offline', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    final result = await repository.getDetails(teamSearch);
    verifyNever(mockTeamDataSource.getDetails(teamSearch));
    expect(result, equals(left(const TeamFailure.isNotConnected())));
  });

  void runTestsOnline(Function test) {
    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test();
    });
  }

  runTestsOnline(() {
    test(
      'Should return team data when the call to the repository is successful',
      () async {
        when(mockTeamDataSource.getDetails(any)).thenAnswer(
          (_) async => teamDetails,
        );
        final result = await repository.getDetails(teamSearch);
        verify(mockTeamDataSource.getDetails(teamSearch));
        expect(result, equals(right(teamDetails)));
      },
    );

    test(
      '''Should return a failure (ServerFailure) when the call to the 
      repository is not successful''',
      () async {
        when(mockTeamDataSource.getDetails(any)).thenThrow(ServerException());
        final result = await repository.getDetails(teamSearch);
        verify(mockTeamDataSource.getDetails(teamSearch));
        expect(result, equals(left(const TeamFailure.serverError())));
      },
    );
  });
}
