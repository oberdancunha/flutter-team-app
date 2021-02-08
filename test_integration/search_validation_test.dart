import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextField = 'team_search_text';

  Future<void> textInput({
    @required WidgetTester tester,
    @required String inputText,
  }) async {
    initModule(
      AppModule(),
      initialModule: true,
    );
    await tester.pumpWidget(AppWidget());
    await tester.enterText(
      find.byKey(const Key(teamSearchTextField)),
      inputText,
    );
    await tester.pumpAndSettle();
    expect(find.byType(AppSearchTeam), findsOneWidget);
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(SearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsNothing);
    expect(find.byType(SearchHistoryListWidget), findsNothing);
    expect(find.byType(TeamPage), findsNothing);
    expect(find.byType(TeamNotFoundWidget), findsNothing);
    expect(find.byType(TeamDetailsWidget), findsNothing);
    expect(find.widgetWithText(SearchPage, inputText), findsOneWidget);
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
