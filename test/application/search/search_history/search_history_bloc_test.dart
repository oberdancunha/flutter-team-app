import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/application/search/search_history/search_history_bloc.dart';
import 'package:teamapp/domain/core/value_sanitize.dart';
import 'package:teamapp/domain/search/i_search_repository.dart';
import 'package:teamapp/domain/search/search_failures.dart';
import 'package:teamapp/infrastructure/search/search_dto.dart';

import '../../../data/json_reader.dart';

class MockSearchRepository extends Mock implements ISearchRepository {}

class MockValueSanitize extends Mock implements ValueSanitize {}

void main() {
  MockSearchRepository mockSearchRepository;
  MockValueSanitize mockValueSanitize;
  SearchHistoryBloc searchHistoryBloc;
  const teamSearch = 'Sao Paulo';
  final searchHistoryJson = jsonReaderList('search/search_history.json');
  final searchHistory = searchHistoryJson
      .map(
        (history) => SearchDto.fromJson(history as Map<String, dynamic>).toDomain(),
      )
      .toImmutableList();

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    mockValueSanitize = MockValueSanitize();
    searchHistoryBloc = SearchHistoryBloc(
      searchRepository: mockSearchRepository,
      valueSanitize: mockValueSanitize,
    );
  });

  test(
    'Should be Initial state',
    () async {
      expect(searchHistoryBloc.state, equals(const SearchHistoryState.initial()));
    },
  );

  void setUpMockValueSanitize() {
    when(mockValueSanitize.removeExcessiveWhiteSpaces(any)).thenReturn(teamSearch);
  }

  group(
    'List\n',
    () {
      void setUpBlocListEvent() {
        searchHistoryBloc.add(const SearchHistoryEvent.list());
      }

      group(
        '\tResult success\n',
        () {
          void setUpMockSearchHistoryListSuccess() {
            when(mockSearchRepository.list()).thenAnswer((_) async => right(searchHistory));
          }

          test(
            '\t\tShould list search history with success',
            () async {
              setUpBlocListEvent();
              setUpMockSearchHistoryListSuccess();
              await untilCalled(mockSearchRepository.list());
              final history = await mockSearchRepository.list();
              expect(history, equals(right(searchHistory)));
            },
          );

          test(
            '\t\tShould change state to load and success',
            () {
              setUpBlocListEvent();
              setUpMockSearchHistoryListSuccess();
              final expected = [
                const SearchHistoryState.load(),
                SearchHistoryState.success(searchHistory, searchHistory),
              ];
              expectLater(
                searchHistoryBloc,
                emitsInOrder(expected),
              );
            },
          );
        },
      );

      group(
        '\tResult Failure\n',
        () {
          void setUpMockSearchHistoryListFailure() {
            when(mockSearchRepository.list()).thenAnswer(
              (_) async => left(SearchFailure.databaseError()),
            );
          }

          test(
            '\t\tShould list search history with failure',
            () async {
              setUpBlocListEvent();
              setUpMockSearchHistoryListFailure();
              await untilCalled(mockSearchRepository.list());
              final history = await mockSearchRepository.list();
              expect(history, equals(left(SearchFailure.databaseError())));
            },
          );

          test(
            '\t\tShould change state to load and failure',
            () async {
              setUpBlocListEvent();
              setUpMockSearchHistoryListFailure();
              final expected = [
                const SearchHistoryState.load(),
                SearchHistoryState.failure(SearchFailure.databaseError())
              ];
              expectLater(
                searchHistoryBloc,
                emitsInOrder(expected),
              );
            },
          );
        },
      );
    },
  );

  group(
    'Filter\n',
    () {
      void setUpBlocFilterEvent() {
        searchHistoryBloc.add(SearchHistoryEvent.filter(searchHistory, searchHistory, teamSearch));
      }

      void setUpMockSearchHistoryFilter() {
        when(mockSearchRepository.filter(
          searchHistory: anyNamed('searchHistory'),
          teamSearch: anyNamed('teamSearch'),
        )).thenReturn(searchHistory);
      }

      test(
        '\tShould call ValueSanitize to remove excessive white spaces',
        () async {
          setUpBlocFilterEvent();
          setUpMockValueSanitize();
          setUpMockSearchHistoryFilter();
          await untilCalled(mockValueSanitize.removeExcessiveWhiteSpaces(any));
          verify(mockValueSanitize.removeExcessiveWhiteSpaces(teamSearch));
        },
      );

      test(
        '\tShould change state to load and success',
        () {
          setUpBlocFilterEvent();
          setUpMockValueSanitize();
          setUpMockSearchHistoryFilter();
          final expected = [
            const SearchHistoryState.load(),
            SearchHistoryState.success(searchHistory, searchHistory),
          ];
          expectLater(
            searchHistoryBloc,
            emitsInOrder(expected),
          );
        },
      );
    },
  );

  group(
    'Insert\n',
    () {
      void setUpBlocInsertEvent() {
        searchHistoryBloc.add(SearchHistoryEvent.insert(searchHistory, searchHistory, teamSearch));
      }

      group('\tInsert Success\n', () {
        void setUpMockSearchHistoryInsertSuccess() {
          when(mockSearchRepository.insert(
            searchHistory: anyNamed('searchHistory'),
            teamSearch: anyNamed('teamSearch'),
          )).thenAnswer((_) async => right(searchHistory));
        }

        test(
          '\t\tShould call ValueSanitize to remove excessive white spaces',
          () async {
            setUpBlocInsertEvent();
            setUpMockValueSanitize();
            setUpMockSearchHistoryInsertSuccess();
            await untilCalled(mockValueSanitize.removeExcessiveWhiteSpaces(any));
            verify(mockValueSanitize.removeExcessiveWhiteSpaces(teamSearch));
          },
        );

        test(
          '\t\tShoud insert search history with success',
          () async {
            setUpBlocInsertEvent();
            setUpMockValueSanitize();
            setUpMockSearchHistoryInsertSuccess();
            final history = await mockSearchRepository.insert(
              searchHistory: searchHistory,
              teamSearch: teamSearch,
            );
            expect(history, equals(right(searchHistory)));
          },
        );

        test(
          '\t\tShould change state to load and success',
          () async {
            setUpBlocInsertEvent();
            setUpMockValueSanitize();
            setUpMockSearchHistoryInsertSuccess();
            final expected = [
              const SearchHistoryState.load(),
              SearchHistoryState.success(searchHistory, searchHistory),
            ];
            expectLater(
              searchHistoryBloc,
              emitsInOrder(expected),
            );
          },
        );
      });

      group('\tInsert Failure\n', () {
        void setUpMockSearchHistoryInsertFailure() {
          when(mockSearchRepository.insert(
            searchHistory: anyNamed('searchHistory'),
            teamSearch: anyNamed('teamSearch'),
          )).thenAnswer((_) async => left(SearchFailure.databaseError()));
        }

        test(
          '\t\tShould insert search history with failure',
          () async {
            setUpBlocInsertEvent();
            setUpMockValueSanitize();
            setUpMockSearchHistoryInsertFailure();
            final history = await mockSearchRepository.insert(
              searchHistory: searchHistory,
              teamSearch: teamSearch,
            );
            expect(history, equals(left(SearchFailure.databaseError())));
          },
        );

        test(
          '\t\tShould change state to load and failure',
          () async {
            setUpBlocInsertEvent();
            setUpMockValueSanitize();
            setUpMockSearchHistoryInsertFailure();
            final expected = [
              const SearchHistoryState.load(),
              SearchHistoryState.failure(SearchFailure.databaseError()),
            ];
            expectLater(
              searchHistoryBloc,
              emitsInOrder(expected),
            );
          },
        );
      });
    },
  );
}
