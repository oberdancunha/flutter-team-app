import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const teamSearchTextField = 'team_search_text';

  Future<void> textInput({
    @required WidgetTester tester,
    @required String teamSearch,
  }) async {
    initModule(
      AppModule(),
      initialModule: true,
    );
    await tester.pumpWidget(AppWidget());
    await tester.pump();
    await tester.enterText(
      find.byKey(const Key(teamSearchTextField)),
      teamSearch,
    );
    await tester.pumpAndSettle();
    expect(find.byType(TeamPage), findsOneWidget);
    expect(find.byType(TeamSearchWidget), findsOneWidget);
    expect(find.byType(TeamSearchFormWidget), findsOneWidget);
    expect(find.byType(SearchHistoryBodyWidget), findsNothing);
    expect(find.byType(SearchHistoryListWidget), findsNothing);
    expect(find.byType(SearchHistoryNotListWidget), findsNothing);
    expect(find.byType(TeamResultWidget), findsNothing);
    expect(find.byType(TeamNotFoundWidget), findsNothing);
    expect(find.byType(TeamDetailsWidget), findsNothing);
    expect(find.widgetWithText(TextFormField, teamSearch), findsOneWidget);
    Modular.removeModule(AppModule());
  }

  testWidgets(
    'Should test field validation when is empty',
    (WidgetTester tester) async {
      await textInput(
        tester: tester,
        teamSearch: ' ',
      );
    },
  );

  testWidgets(
    'Should test field validation when is invalid',
    (WidgetTester tester) async {
      await textInput(
        tester: tester,
        teamSearch: '*&@!',
      );
    },
  );
}
