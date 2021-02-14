import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamapp/core/errors/exceptions/database_exception.dart';
import 'package:teamapp/infrastructure/search_history/search_history_data_source_sp.dart';

import '../../data/json_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  MockSharedPreferences mockSharedPreferences;
  SearchHistoryDataSourceSP searchHistoryDataSourceSP;
  const searchHistoryKey = 'searchHistory';
  final searchHistory = jsonReaderList('search/search_history.json')
      .map(
        (history) => history.toString(),
      )
      .toList();

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockSharedPreferences = MockSharedPreferences();
    searchHistoryDataSourceSP = SearchHistoryDataSourceSP(mockSharedPreferences);
  });

  void setUpMockInitialValues() {
    SharedPreferences.setMockInitialValues({
      searchHistoryKey: searchHistory,
    });
  }

  group(
    'list\n',
    () {
      test(
        '\tShould return a search history list',
        () async {
          setUpMockInitialValues();
          final history = await searchHistoryDataSourceSP.list();
          expect(history, equals(searchHistory));
        },
      );

      test(
        '\tShould return a DatabaseException error when listing search history',
        () async {
          when(mockSharedPreferences.getStringList(any)).thenThrow(Exception());
          final call = searchHistoryDataSourceSP.list;
          expect(
            () => call(),
            throwsA(
              const TypeMatcher<DatabaseException>(),
            ),
          );
        },
      );
    },
  );

  group(
    'Insert\n',
    () {
      test(
        '\tShould insert the search history with success',
        () async {
          when(mockSharedPreferences.setStringList(any, any)).thenAnswer((_) async => true);
          final call = searchHistoryDataSourceSP.insert;
          expect(
            () => call(searchHistory),
            const TypeMatcher<void>(),
          );
        },
      );

      test(
        '\tShould return the DatabaseException error on insert search history',
        () async {
          when(mockSharedPreferences.setStringList(any, any)).thenThrow(Exception());
          final call = searchHistoryDataSourceSP.insert;
          expect(
            () => call(searchHistory),
            throwsA(
              const TypeMatcher<DatabaseException>(),
            ),
          );
        },
      );
    },
  );
}
