import 'package:dartz/dartz.dart' hide Bind;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/config_reader.dart';
import 'package:teamapp/domain/search_history/i_search_history_repository.dart';
import 'package:teamapp/infrastructure/search_history/search_history_dto.dart';
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

class MockDio extends Mock implements Dio {}

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

class MockSearchHistoryRepository extends Mock implements ISearchHistoryRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextFieldKey = 'team_search_text';
  MockDio mockDio;
  MockDataConnectionChecker mockDataConnectionChecker;
  MockSearchHistoryRepository mockSearchHistoryRepository;
  const teamSearch = 'Sao Paulo';
  final searchHistory = [
    SearchHistoryDto(position: 1, teamSearch: teamSearch).toDomain(),
    SearchHistoryDto(position: 0, teamSearch: 'River Plate').toDomain()
  ].toImmutableList();

  setUp(() async {
    await ConfigReader.initialize();
    mockDio = MockDio();
    mockDataConnectionChecker = MockDataConnectionChecker();
    mockSearchHistoryRepository = MockSearchHistoryRepository();
  });

  void setUpMockSearchHistoryList() {
    when(mockSearchHistoryRepository.list()).thenAnswer((_) async => right(searchHistory));
  }

  void setUpMockSearchHistoryFilter() {
    final searchHistory = [
      SearchHistoryDto(position: 1, teamSearch: teamSearch).toDomain(),
    ].toImmutableList();
    when(mockSearchHistoryRepository.filter(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenReturn(searchHistory);
  }

  void setUpMockSearchHistoryInsert() {
    when(mockSearchHistoryRepository.insert(
      searchHistory: anyNamed('searchHistory'),
      teamSearch: anyNamed('teamSearch'),
    )).thenAnswer((_) async => right(searchHistory));
  }

  Future<void> setUpSearchAndTeamDetails({
    @required WidgetTester tester,
  }) async {
    setUpMockSearchHistoryList();
    setUpMockSearchHistoryFilter();
    setUpMockSearchHistoryInsert();
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
    await tester.pumpAndSettle();
    expect(find.byType(AppSearchTeam), findsOneWidget);
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(SearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsOneWidget);
    expect(find.byType(SearchHistoryListWidget), findsOneWidget);
    await expectLater(find.byType(TeamPage), findsNothing);
    await expectLater(find.byType(TeamNotFoundWidget), findsNothing);
    await expectLater(find.byType(TeamDetailsWidget), findsNothing);
    expect(find.widgetWithText(TextFormField, teamSearch), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should return message when server error',
    (WidgetTester tester) async {
      initModule(
        AppModule(),
        initialModule: true,
        changeBinds: [
          Bind<Dio>((i) => mockDio),
          Bind<ISearchHistoryRepository>((i) => mockSearchHistoryRepository),
        ],
      );
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
      await setUpSearchAndTeamDetails(tester: tester);
    },
  );

  testWidgets(
    'Should return message when device is offline',
    (WidgetTester tester) async {
      initModule(
        AppModule(),
        initialModule: true,
        changeBinds: [
          Bind<DataConnectionChecker>((i) => mockDataConnectionChecker),
          Bind<ISearchHistoryRepository>((i) => mockSearchHistoryRepository),
        ],
      );
      when(mockDataConnectionChecker.hasConnection).thenAnswer(
        (_) async => false,
      );
      await setUpSearchAndTeamDetails(tester: tester);
    },
  );
}
