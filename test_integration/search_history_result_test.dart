import 'package:dartz/dartz.dart' hide Bind;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/domain/search/i_search_repository.dart';
import 'package:teamapp/infrastructure/search/search_dto.dart';
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

class MockSearchRepository extends Mock implements ISearchRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  MockSearchRepository mockSearchRepository;
  const teamSearchTextFieldKey = 'team_search_text';
  const teamSearch = 'Sao Paulo';
  final searchHistory = [
    SearchDto(position: 0, teamSearch: 'Real Madrid').toDomain(),
    SearchDto(position: 1, teamSearch: 'AC Milan').toDomain(),
    SearchDto(position: 2, teamSearch: 'River Plate').toDomain(),
    SearchDto(position: 3, teamSearch: 'Sao Paulo').toDomain(),
  ];

  setUp(() {
    mockSearchRepository = MockSearchRepository();
  });

  void setUpMockSearchHistoryList() {
    when(mockSearchRepository.list()).thenAnswer(
      (_) async => right(searchHistory.reversed.toImmutableList()),
    );
  }

  void setUpMockSearchHistoryFilter(String teamSearch) {
    final searchHistory = [
      SearchDto(position: 1, teamSearch: teamSearch).toDomain(),
    ].toImmutableList();
    when(mockSearchRepository.filter(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenReturn(searchHistory);
  }

  Future<void> setUpSearchHistory(WidgetTester tester) async {
    initModule(
      AppModule(),
      initialModule: true,
      changeBinds: [Bind<ISearchRepository>((i) => mockSearchRepository)],
    );
    setUpMockSearchHistoryList();
    setUpMockSearchHistoryFilter(teamSearch);
    await tester.pumpWidget(AppWidget());
    await tester.tap(
      find.byKey(const Key(teamSearchTextFieldKey)),
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 700));
    await tester.enterText(
      find.byKey(const Key(teamSearchTextFieldKey)),
      teamSearch,
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 1));
    expect(find.byType(AppSearchTeam), findsOneWidget);
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(SearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsOneWidget);
    expect(find.byType(SearchHistoryListWidget), findsOneWidget);
    expect(find.byType(TeamPage), findsNothing);
    expect(find.byType(TeamNotFoundWidget), findsNothing);
    expect(find.byType(TeamDetailsWidget), findsNothing);
    expect(find.widgetWithText(TextFormField, teamSearch), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should list and filter search history',
    (WidgetTester tester) async {
      await setUpSearchHistory(tester);
    },
  );
}
