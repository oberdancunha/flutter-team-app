import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/application/team/team_form_search/team_form_search_bloc.dart';
import 'package:teamapp/domain/core/failures.dart';
import 'package:teamapp/domain/core/value_sanitize.dart';
import 'package:teamapp/domain/search/value_objects.dart';
import 'package:teamapp/domain/teams/i_team_repository.dart';
import 'package:teamapp/domain/teams/team.dart';

class MockTeamRepository extends Mock implements ITeamRepository {}

class MockValueSanitize extends Mock implements ValueSanitize {}

void main() {
  TeamFormSearchBloc teamFormSearchBloc;
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
    teamFormSearchBloc = TeamFormSearchBloc(
      teamRepository: mockTeamRepository,
      valueSanitize: mockValueSanitize,
    );
  });

  test(
    'Should be initial state',
    () {
      expect(teamFormSearchBloc.state, equals(TeamFormSearchState.initial()));
    },
  );

  void setUpMockValueSanitize() {
    when(mockValueSanitize.removeExcessiveWhitspaces(any))
        .thenReturn(teamSearch);
  }

  void setUpBlocEvents() {
    teamFormSearchBloc.add(const TeamFormSearchEvent.changeTeam(teamSearch));
    teamFormSearchBloc.add(const TeamFormSearchEvent.search(teamSearch));
  }

  test(
    'Should call for the sanitization of excessive spaces',
    () async {
      setUpMockValueSanitize();
      setUpBlocEvents();
      await untilCalled(mockValueSanitize.removeExcessiveWhitspaces(any));
      verify(mockValueSanitize.removeExcessiveWhitspaces(teamSearch));
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
        'Should obtain team result',
        () async {
          setUpMockValueSanitize();
          setUpMockResultSuccess();
          setUpBlocEvents();
          await untilCalled(mockTeamRepository.getDetails(any));
          verify(mockTeamRepository.getDetails(teamSearch));
        },
      );

      test(
        'Should verify result success state',
        () {
          setUpMockResultSuccess();
          final expected = [
            TeamFormSearchState(
              teamFailureOrSuccess: none(),
              teamSearch: SearchText(teamSearch),
              isSearching: false,
            ),
            TeamFormSearchState(
              teamFailureOrSuccess: none(),
              teamSearch: SearchText(teamSearch),
              isSearching: true,
            ),
            TeamFormSearchState(
              teamFailureOrSuccess: optionOf(right(teamDetails)),
              teamSearch: SearchText(teamSearch),
              isSearching: false,
            ),
          ];
          expectLater(
            teamFormSearchBloc,
            emitsInOrder(expected),
          );
          setUpBlocEvents();
        },
      );
    },
  );

  group('Result Error', () {
    void setUpMockResultError(Failure failure) {
      when(mockTeamRepository.getDetails(any)).thenAnswer(
        (_) async => left(failure),
      );
    }

    Future<void> testResultError(Failure failure) async {
      setUpMockValueSanitize();
      setUpMockResultError(failure);
      setUpBlocEvents();
      await untilCalled(mockTeamRepository.getDetails(any));
      verify(mockTeamRepository.getDetails(teamSearch));
    }

    void testStateError(Failure failure) {
      setUpMockResultError(failure);
      final expected = [
        TeamFormSearchState(
          teamFailureOrSuccess: none(),
          teamSearch: SearchText(teamSearch),
          isSearching: false,
        ),
        TeamFormSearchState(
          teamFailureOrSuccess: none(),
          teamSearch: SearchText(teamSearch),
          isSearching: true,
        ),
        TeamFormSearchState(
          teamFailureOrSuccess: optionOf(left(failure)),
          teamSearch: SearchText(teamSearch),
          isSearching: false,
        ),
      ];
      expectLater(
        teamFormSearchBloc,
        emitsInOrder(expected),
      );
      setUpBlocEvents();
    }

    group('Server error', () {
      const serverError = Failure.serverError();
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
      const connectionError = Failure.isNotConnected();
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
