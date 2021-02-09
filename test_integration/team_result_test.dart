import 'package:dartz/dartz.dart' hide Bind;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/config_reader.dart';
import 'package:teamapp/domain/search_history/i_search_history_repository.dart';
import 'package:teamapp/domain/team/i_team_repository.dart';
import 'package:teamapp/domain/team/team.dart';
import 'package:teamapp/infrastructure/search_history/search_history_dto.dart';
import 'package:teamapp/infrastructure/team/team_dto.dart';
import 'package:teamapp/presentation/core/app_module.dart';
import 'package:teamapp/presentation/core/app_search_team.dart';
import 'package:teamapp/presentation/core/app_widget.dart';
import 'package:teamapp/presentation/search/search_page.dart';
import 'package:teamapp/presentation/search/widgets/search_form_widget.dart';
import 'package:teamapp/presentation/search/widgets/search_history_body_widget.dart';
import 'package:teamapp/presentation/search/widgets/search_history_list_widget.dart';
import 'package:teamapp/presentation/team/team_page.dart';
import 'package:teamapp/presentation/team/widgets/team_details_widget.dart';
import 'package:teamapp/presentation/team/widgets/team_not_found_widget.dart';

class MockTeamRepository extends Mock implements ITeamRepository {}

class MockSearchHistoryRepository extends Mock implements ISearchHistoryRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextFieldKey = 'team_search_text';
  MockSearchHistoryRepository mockSearchHistoryRepository;
  MockTeamRepository mockTeamRepository;
  final teamDetails = TeamDto.fromJson({
    "id": 126,
    "name": "Sao Paulo",
    "country": "Brasil",
    "founded": 1930,
    "logo": "https://media.api-sports.io/football/teams/126.png"
  }).toDomain();
  final searchHistoryDefault = SearchHistoryDto(position: 0, teamSearch: 'River Plate').toDomain();

  setUp(() async {
    await ConfigReader.initialize();
    mockSearchHistoryRepository = MockSearchHistoryRepository();
    mockTeamRepository = MockTeamRepository();
  });

  void setUpMockGetTeamDetails(Team returnData) {
    when(mockTeamRepository.getDetails(any)).thenAnswer(
      (_) async => right(returnData),
    );
  }

  void setUpMockSearchHistoryList() {
    final searchHistory = [searchHistoryDefault].toImmutableList();
    when(mockSearchHistoryRepository.list()).thenAnswer((_) async => right(searchHistory));
  }

  void setUpMockSearchHistoryFilter(String teamSearch) {
    when(mockSearchHistoryRepository.filter(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenReturn(const KtList.empty());
  }

  void setUpMockSearchHistoryInsert(String teamSearch) {
    final searchHistory = [
      SearchHistoryDto(position: 1, teamSearch: teamSearch).toDomain(),
      searchHistoryDefault,
    ].toImmutableList();
    when(mockSearchHistoryRepository.insert(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenAnswer((_) async => right(searchHistory));
  }

  Future<void> setUpSearchAndTeamDetails({
    @required WidgetTester tester,
    @required String teamSearch,
    @required int pumpMilliseconds,
    @required Function body,
  }) async {
    initModule(
      AppModule(),
      initialModule: true,
      changeBinds: [
        Bind<ISearchHistoryRepository>((i) => mockSearchHistoryRepository),
        Bind<ITeamRepository>((i) => mockTeamRepository)
      ],
    );
    setUpMockSearchHistoryList();
    setUpMockSearchHistoryFilter(teamSearch);
    setUpMockSearchHistoryInsert(teamSearch);
    await tester.pumpWidget(AppWidget());
    await tester.tap(
      find.byKey(const Key(teamSearchTextFieldKey)),
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 700));
    await tester.enterText(
      find.byKey(const Key(teamSearchTextFieldKey)),
      teamSearch,
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 700));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(Duration(milliseconds: pumpMilliseconds));
    expect(find.byType(AppSearchTeam), findsOneWidget);
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(SearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsOneWidget);
    expect(find.byType(SearchHistoryListWidget), findsOneWidget);
    await expectLater(find.byType(TeamPage), findsOneWidget);
    body();
    expect(find.widgetWithText(TextFormField, teamSearch), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should return an alert when the team searched is not found',
    (WidgetTester tester) async {
      const teamSearch = 'Sao Paul';
      setUpMockGetTeamDetails(Team.empty());
      await setUpSearchAndTeamDetails(
        tester: tester,
        teamSearch: teamSearch,
        pumpMilliseconds: 1,
        body: () async {
          await expectLater(find.byType(TeamNotFoundWidget), findsOneWidget);
          await expectLater(find.byType(TeamDetailsWidget), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'Should return the data when the team searched is found',
    (WidgetTester tester) async {
      const teamSearch = 'Sao Paulo';
      setUpMockGetTeamDetails(teamDetails);
      await setUpSearchAndTeamDetails(
        tester: tester,
        teamSearch: teamSearch,
        pumpMilliseconds: 3000,
        body: () async {
          await expectLater(find.byType(TeamNotFoundWidget), findsNothing);
          await expectLater(find.byType(TeamDetailsWidget), findsOneWidget);
        },
      );
    },
  );
}
