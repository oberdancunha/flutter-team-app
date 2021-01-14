import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:teamapp/app_module.dart';
import 'package:teamapp/config_reader.dart';
import 'package:teamapp/presentation/core/app_widget.dart';
import 'package:teamapp/presentation/team/widget/team_details.dart';
import 'package:teamapp/presentation/team/widget/team_form.dart';
import 'package:teamapp/presentation/team/widget/team_form_result.dart';
import 'package:teamapp/presentation/team/widget/team_not_found.dart';
import 'package:teamapp/presentation/team/widget/team_result.dart';
import 'package:teamapp/presentation/team/widget/team_result_details.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextFieldKey = 'team_search_text';

  setUp(() async {
    await ConfigReader.initialize();
  });

  Future<void> searchResult({
    @required WidgetTester tester,
    @required String inputText,
    @required int pumpMilliseconds,
    @required Function body,
  }) async {
    initModule(AppModule(), initialModule: true);
    await tester.pumpWidget(AppWidget());
    await tester.enterText(
      find.byKey(const Key(teamSearchTextFieldKey)),
      inputText,
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(Duration(milliseconds: pumpMilliseconds));
    expect(find.byType(TeamFormResult), findsOneWidget);
    expect(find.byType(TeamForm), findsOneWidget);
    await expectLater(find.byType(TeamResult), findsOneWidget);
    await expectLater(find.byType(TeamResultDetails), findsOneWidget);
    body();
    expect(find.widgetWithText(TextFormField, inputText), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should return an alert when the team searched is not found',
    (WidgetTester tester) async {
      await searchResult(
        tester: tester,
        inputText: 'Sao Paul',
        pumpMilliseconds: 1,
        body: () async {
          await expectLater(find.byType(TeamNotFound), findsOneWidget);
          await expectLater(find.byType(TeamDetails), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'Should return the data when the team searched is found',
    (WidgetTester tester) async {
      await searchResult(
        tester: tester,
        inputText: 'Sao Paulo',
        pumpMilliseconds: 2000,
        body: () async {
          await expectLater(find.byType(TeamNotFound), findsNothing);
          await expectLater(find.byType(TeamDetails), findsOneWidget);
        },
      );
    },
  );
}
