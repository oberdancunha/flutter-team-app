import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/application/team/team_details/team_details_bloc.dart';
import 'package:teamapp/domain/core/value_sanitize.dart';
import 'package:teamapp/domain/team/i_team_repository.dart';
import 'package:teamapp/domain/team/team.dart';
import 'package:teamapp/domain/team/team_failures.dart';
import 'package:teamapp/domain/team/value_objects.dart';

class MockTeamRepository extends Mock implements ITeamRepository {}

class MockValueSanitize extends Mock implements ValueSanitize {}

void main() {
  TeamDetailsBloc teamDetailsBloc;
  MockTeamRepository mockTeamRepository;
  MockValueSanitize mockValueSanitize;
  const teamSearch = 'Sao Paulo';
  final teamDetails = Team(
    id: 1,
    name: 'Sao Paulo',
    country: 'Brazil',
    founded: 1930,
    logo: 'logo test',
  );

  setUp(() {
    mockTeamRepository = MockTeamRepository();
    mockValueSanitize = MockValueSanitize();
    teamDetailsBloc = TeamDetailsBloc(
      teamRepository: mockTeamRepository,
      valueSanitize: mockValueSanitize,
    );
  });

  test(
    'Should be initial state',
    () {
      expect(teamDetailsBloc.state, equals(TeamDetailsState.initial()));
    },
  );

  void setUpMockValueSanitize() {
    when(mockValueSanitize.removeExcessiveWhiteSpaces(any)).thenReturn(teamSearch);
  }

  void setUpBlocEvents() {
    teamDetailsBloc.add(const TeamDetailsEvent.changeTeam(teamSearch));
    teamDetailsBloc.add(const TeamDetailsEvent.search(teamSearch));
  }

  test(
    'Should call ValueSanitize to remove excessive white spaces',
    () async {
      setUpMockValueSanitize();
      setUpBlocEvents();
      await untilCalled(mockValueSanitize.removeExcessiveWhiteSpaces(any));
      verify(mockValueSanitize.removeExcessiveWhiteSpaces(teamSearch));
    },
  );

  group(
    'Result success',
    () {
      void setUpMockResultSuccess() {
        when(mockTeamRepository.getDetails(any)).thenAnswer(
          (_) async => right(teamDetails),
        );
      }

      test(
        'Should get team result',
        () async {
          setUpMockValueSanitize();
          setUpMockResultSuccess();
          setUpBlocEvents();
          await untilCalled(mockTeamRepository.getDetails(any));
          verify(mockTeamRepository.getDetails(teamSearch));
        },
      );

      test(
        'Should obtain team result success',
        () async {
          setUpMockValueSanitize();
          setUpMockResultSuccess();
          setUpBlocEvents();
          await untilCalled(mockTeamRepository.getDetails(any));
          final teamResult = await mockTeamRepository.getDetails(teamSearch);
          expect(teamResult, equals(right(teamDetails)));
        },
      );

      test(
        'Should verify result success state',
        () {
          setUpMockResultSuccess();
          final expected = [
            TeamDetailsState(
              teamFailureOrSuccess: none(),
              teamSearch: SearchTerm(teamSearch),
              isSearching: false,
            ),
            TeamDetailsState(
              teamFailureOrSuccess: none(),
              teamSearch: SearchTerm(teamSearch),
              isSearching: true,
            ),
            TeamDetailsState(
              teamFailureOrSuccess: optionOf(right(teamDetails)),
              teamSearch: SearchTerm(teamSearch),
              isSearching: false,
            ),
          ];
          expectLater(
            teamDetailsBloc,
            emitsInOrder(expected),
          );
          setUpBlocEvents();
        },
      );
    },
  );

  group('Result Error', () {
    void setUpMockResultError(TeamFailure failure) {
      when(mockTeamRepository.getDetails(any)).thenAnswer(
        (_) async => left(failure),
      );
    }

    Future<void> testResultError(TeamFailure failure) async {
      setUpMockValueSanitize();
      setUpMockResultError(failure);
      setUpBlocEvents();
      await untilCalled(mockTeamRepository.getDetails(any));
      verify(mockTeamRepository.getDetails(teamSearch));
    }

    void testStateError(TeamFailure failure) {
      setUpMockResultError(failure);
      final expected = [
        TeamDetailsState(
          teamFailureOrSuccess: none(),
          teamSearch: SearchTerm(teamSearch),
          isSearching: false,
        ),
        TeamDetailsState(
          teamFailureOrSuccess: none(),
          teamSearch: SearchTerm(teamSearch),
          isSearching: true,
        ),
        TeamDetailsState(
          teamFailureOrSuccess: optionOf(left(failure)),
          teamSearch: SearchTerm(teamSearch),
          isSearching: false,
        ),
      ];
      expectLater(
        teamDetailsBloc,
        emitsInOrder(expected),
      );
      setUpBlocEvents();
    }

    group('Server error', () {
      const serverError = TeamFailure.serverError();
      test(
        'Should obtain server error result',
        () async {
          await testResultError(serverError);
        },
      );
      test(
        'Should verify server error state result',
        () {
          testStateError(serverError);
        },
      );
    });
    group('Connection error', () {
      const connectionError = TeamFailure.isNotConnected();
      test(
        'Should obtain connection error result',
        () async {
          await testResultError(connectionError);
        },
      );
      test(
        'Should verify connection error state result',
        () {
          testStateError(connectionError);
        },
      );
    });
  });
}
