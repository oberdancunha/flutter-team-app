import 'package:dartz/dartz.dart' hide Bind;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/domain/search_history/i_search_history_repository.dart';
import 'package:teamapp/domain/search_history/search_history_failures.dart';
import 'package:teamapp/infrastructure/search_history/search_history_dto.dart';
import 'package:teamapp/presentation/core/app_module.dart';
import 'package:teamapp/presentation/core/app_widget.dart';
import 'package:teamapp/presentation/search_history/search_history_body_widget.dart';
import 'package:teamapp/presentation/search_history/search_history_list_widget.dart';
import 'package:teamapp/presentation/search_history/search_history_not_list_widget.dart';
import 'package:teamapp/presentation/team/team_page.dart';
import 'package:teamapp/presentation/team/widgets/team_details_widget.dart';
import 'package:teamapp/presentation/team/widgets/team_not_found_widget.dart';
import 'package:teamapp/presentation/team/widgets/team_result_widget.dart';
import 'package:teamapp/presentation/team/widgets/team_search_form_widget.dart';
import 'package:teamapp/presentation/team/widgets/team_search_widget.dart';

class MockSearchHistoryRepository extends Mock implements ISearchHistoryRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  MockSearchHistoryRepository mockSearchHistoryRepository;
  const teamSearchTextFieldKey = 'team_search_text';
  const teamSearch = 'Sao Paulo';
  final searchHistory = [
    SearchHistoryDto(position: 0, teamSearch: 'Real Madrid').toDomain(),
    SearchHistoryDto(position: 1, teamSearch: 'AC Milan').toDomain(),
    SearchHistoryDto(position: 2, teamSearch: 'River Plate').toDomain(),
    SearchHistoryDto(position: 3, teamSearch: 'Sao Paulo').toDomain(),
    SearchHistoryDto(position: 4, teamSearch: 'Santos').toDomain(),
  ];

  setUp(() {
    mockSearchHistoryRepository = MockSearchHistoryRepository();
  });

  void setUpMockSearchHistoryListSuccess() {
    when(mockSearchHistoryRepository.list()).thenAnswer(
      (_) async => right(searchHistory.reversed.toImmutableList()),
    );
  }

  void setUpMockSearchHistoryListFailure() {
    when(mockSearchHistoryRepository.list()).thenAnswer(
      (_) async => left(SearchHistoryFailure.databaseError()),
    );
  }

  void setUpMockSearchHistoryListEmpty() {
    when(mockSearchHistoryRepository.list()).thenAnswer(
      (_) async => right(const KtList.empty()),
    );
  }

  void setUpMockSearchHistoryFilter(String teamSearch) {
    final searchHistory = [
      SearchHistoryDto(position: 3, teamSearch: teamSearch).toDomain(),
    ].toImmutableList();
    when(mockSearchHistoryRepository.filter(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenReturn(searchHistory);
  }

  void setUpMockSearchHistoryFilterAfterClear() {
    when(mockSearchHistoryRepository.filter(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenReturn(searchHistory.reversed.toImmutableList());
  }

  Future<void> setUpSearchHistory({
    @required WidgetTester tester,
    @required bool enterText,
    @required Function customizedBody,
  }) async {
    initModule(
      AppModule(),
      initialModule: true,
      changeBinds: [Bind<ISearchHistoryRepository>((i) => mockSearchHistoryRepository)],
    );
    await tester.pumpWidget(AppWidget());
    await tester.pump();
    await tester.tap(find.byKey(const Key(teamSearchTextFieldKey)));
    await tester.pumpAndSettle(const Duration(milliseconds: 700));
    if (enterText) {
      await tester.enterText(
        find.byKey(const Key(teamSearchTextFieldKey)),
        teamSearch,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 1));
    }
    await customizedBody();
    expect(find.byType(TeamPage), findsOneWidget);
    expect(find.byType(TeamSearchWidget), findsOneWidget);
    expect(find.byType(TeamSearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsOneWidget);
    expect(find.byType(TeamResultWidget), findsNothing);
    expect(find.byType(TeamNotFoundWidget), findsNothing);
    expect(find.byType(TeamDetailsWidget), findsNothing);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should obtain a DatabaseError when listing the search history',
    (WidgetTester tester) async {
      setUpMockSearchHistoryListFailure();
      setUpMockSearchHistoryFilter(teamSearch);
      await setUpSearchHistory(
        tester: tester,
        enterText: false,
        customizedBody: () {
          expect(find.byType(SearchHistoryListWidget), findsNothing);
          expect(find.byType(SearchHistoryNotListWidget), findsOneWidget);
        },
      );
      await tester.pump(const Duration(milliseconds: 700));
    },
  );

  testWidgets(
    'Should obtain search history empty list',
    (WidgetTester tester) async {
      setUpMockSearchHistoryListEmpty();
      setUpMockSearchHistoryFilter(teamSearch);
      await setUpSearchHistory(
        tester: tester,
        enterText: false,
        customizedBody: () {
          expect(find.byType(SearchHistoryListWidget), findsNothing);
          expect(find.byType(SearchHistoryNotListWidget), findsOneWidget);
        },
      );
      await tester.pump(const Duration(milliseconds: 700));
    },
  );

  testWidgets(
    'Should list and filter search history',
    (WidgetTester tester) async {
      setUpMockSearchHistoryListSuccess();
      setUpMockSearchHistoryFilter(teamSearch);
      await setUpSearchHistory(
        tester: tester,
        enterText: true,
        customizedBody: () {
          expect(find.byType(SearchHistoryListWidget), findsOneWidget);
          expect(find.byType(SearchHistoryNotListWidget), findsNothing);
        },
      );
      expect(find.widgetWithText(TextFormField, teamSearch), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
    },
  );

  testWidgets(
    'Should list and filter search history and then clear the team searched',
    (WidgetTester tester) async {
      setUpMockSearchHistoryListSuccess();
      setUpMockSearchHistoryFilter(teamSearch);
      await setUpSearchHistory(
        tester: tester,
        enterText: true,
        customizedBody: () async {
          setUpMockSearchHistoryFilterAfterClear();
          await tester.press(find.byKey(const Key('clear_team_search')));
          await tester.pump(const Duration(milliseconds: 700));
          await tester.enterText(
            find.byKey(const Key(teamSearchTextFieldKey)),
            '',
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 700));
          expect(find.byType(SearchHistoryListWidget), findsOneWidget);
          expect(find.byType(SearchHistoryNotListWidget), findsNothing);
        },
      );
      expect(find.widgetWithText(TextFormField, ''), findsOneWidget);
    },
  );
}
