import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/config_reader.dart';
import 'package:teamapp/presentation/core/app_module.dart';
import 'package:teamapp/presentation/core/app_widget.dart';
import 'package:teamapp/presentation/team/widget/team_details.dart';
import 'package:teamapp/presentation/team/widget/team_form.dart';
import 'package:teamapp/presentation/team/widget/team_form_result.dart';
import 'package:teamapp/presentation/team/widget/team_not_found.dart';
import 'package:teamapp/presentation/team/widget/team_result.dart';
import 'package:teamapp/presentation/team/widget/team_result_details.dart';

class MockDio extends Mock implements Dio {}

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextField = 'team_search_text';
  MockDio mockDio;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() async {
    await ConfigReader.initialize();
    mockDio = MockDio();
    mockDataConnectionChecker = MockDataConnectionChecker();
  });

  Future<void> searchResult({
    @required WidgetTester tester,
  }) async {
    const inputText = 'Sao Paulo';
    await tester.pumpWidget(AppWidget());
    await tester.enterText(
      find.byKey(const Key(teamSearchTextField)),
      inputText,
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.byType(TeamFormResult), findsOneWidget);
    expect(find.byType(TeamForm), findsOneWidget);
    expect(find.byType(TeamResult), findsOneWidget);
    await expectLater(find.byType(TeamResultDetails), findsNothing);
    await expectLater(find.byType(TeamNotFound), findsNothing);
    await expectLater(find.byType(TeamDetails), findsNothing);
    expect(find.widgetWithText(TextFormField, inputText), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should return message when server error',
    (WidgetTester tester) async {
      initModule(
        AppModule(),
        initialModule: true,
        changeBinds: [Bind<Dio>((i) => mockDio)],
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
      await searchResult(tester: tester);
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
        ],
      );
      when(mockDataConnectionChecker.hasConnection).thenAnswer(
        (_) async => false,
      );
      await searchResult(tester: tester);
    },
  );
}
