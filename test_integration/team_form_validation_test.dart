import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:teamapp/app_module.dart';
import 'package:teamapp/presentation/core/app_widget.dart';
import 'package:teamapp/presentation/team/widget/team_details.dart';
import 'package:teamapp/presentation/team/widget/team_form.dart';
import 'package:teamapp/presentation/team/widget/team_form_result.dart';
import 'package:teamapp/presentation/team/widget/team_not_found.dart';
import 'package:teamapp/presentation/team/widget/team_result.dart';
import 'package:teamapp/presentation/team/widget/team_result_details.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextField = 'team_search_text';

  Future<void> textInput({
    @required WidgetTester tester,
    @required String inputText,
  }) async {
    initModule(AppModule(), initialModule: true);
    await tester.pumpWidget(AppWidget());
    await tester.enterText(
      find.byKey(const Key(teamSearchTextField)),
      inputText,
    );
    await tester.pumpAndSettle();
    expect(find.byType(TeamFormResult), findsOneWidget);
    expect(find.byType(TeamForm), findsOneWidget);
    expect(find.byType(TeamResult), findsOneWidget);
    expect(find.byType(TeamResultDetails), findsNothing);
    expect(find.byType(TeamNotFound), findsNothing);
    expect(find.byType(TeamDetails), findsNothing);
    expect(find.widgetWithText(TextFormField, inputText), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should test field validation when is empty',
    (WidgetTester tester) async {
      await textInput(
        tester: tester,
        inputText: ' ',
      );
    },
  );

  testWidgets(
    'Should test field validation when is invalid',
    (WidgetTester tester) async {
      await textInput(
        tester: tester,
        inputText: '*&@!',
      );
    },
  );
}
