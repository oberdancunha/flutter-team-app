import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/core/errors/exceptions/database_exception.dart';
import 'package:teamapp/domain/search/i_search_data_source.dart';
import 'package:teamapp/domain/search/search.dart';
import 'package:teamapp/domain/search/search_failures.dart';
import 'package:teamapp/domain/search/value_objects.dart';
import 'package:teamapp/infrastructure/search/search_dto.dart';
import 'package:teamapp/infrastructure/search/search_repository.dart';

import '../../data/json_reader.dart';

class MockSearchDataSource extends Mock implements ISearchDataSource {}

void main() {
  MockSearchDataSource mockSearchDataSource;
  SearchRepository searchRepository;
  final searchHistoryJson = jsonReaderList('search/search_history.json');
  final searchHistory = searchHistoryJson
      .map(
        (history) => SearchDto.fromJson(history as Map<String, dynamic>).toDomain(),
      )
      .toImmutableList();

  setUp(
    () {
      mockSearchDataSource = MockSearchDataSource();
      searchRepository = SearchRepository(mockSearchDataSource);
    },
  );

  group('All\n', () {
    test(
      '\tShould get all search history return success',
      () async {
        when(mockSearchDataSource.list()).thenAnswer(
          (_) async => searchHistory
              .asList()
              .map(
                (history) => json.encode(SearchDto.fromDomain(history)),
              )
              .toList(),
        );
        final history = await searchRepository.list();
        expect(history, equals(right(searchHistory)));
      },
    );

    test(
      '\tShould return an empty search history list',
      () async {
        when(mockSearchDataSource.list()).thenAnswer((_) async => List.empty());
        final history = await searchRepository.list();
        expect(history, equals(right(const KtList.empty())));
      },
    );

    test(
      '\tShould return a database error when retrieving all search history',
      () async {
        when(mockSearchDataSource.list()).thenThrow(DatabaseException());
        final history = await searchRepository.list();
        expect(history, equals(left(SearchFailure.databaseError())));
      },
    );
  });

  group('Filter\n', () {
    test(
      '\tShould return one result search history according to a term',
      () {
        const term = 'Sao';
        final searchHistoryFiltered = searchRepository.filter(
          searchHistory: searchHistory,
          teamSearch: term,
        );
        expect(
          searchHistoryFiltered,
          equals(KtList.of(
            Search(position: 0, teamSearch: SearchTerm('Sao Paulo')),
          )),
        );
      },
    );

    test(
      '\tShould return two results search history according to a term',
      () {
        const term = 'R';
        final searchHistoryFiltered = searchRepository.filter(
          searchHistory: searchHistory,
          teamSearch: term,
        );
        expect(
          searchHistoryFiltered,
          equals(KtList.of(
            Search(position: 4, teamSearch: SearchTerm('River Plate')),
            Search(position: 2, teamSearch: SearchTerm('Real Madrid')),
          )),
        );
      },
    );
  });

  group('Add\n', () {
    test(
      '\tShould move an existing term to the bottom of the search history list',
      () async {
        final searchHistoryModifiedExpected = KtList.of(
          Search(position: 1, teamSearch: SearchTerm('AC Milan')),
          Search(position: 2, teamSearch: SearchTerm('Real Madrid')),
          Search(position: 3, teamSearch: SearchTerm('Barcelona')),
          Search(position: 4, teamSearch: SearchTerm('River Plate')),
          Search(position: 5, teamSearch: SearchTerm('Sao Paulo')),
        );
        final searchHistoryModified = await searchRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'Sao Paulo',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '''\tShould add a new term to the bottom of the search history list when the list already 
    contains the maximum number of terms''',
      () async {
        final searchHistoryModifiedExpected = KtList.of(
          Search(position: 1, teamSearch: SearchTerm('AC Milan')),
          Search(position: 2, teamSearch: SearchTerm('Real Madrid')),
          Search(position: 3, teamSearch: SearchTerm('Barcelona')),
          Search(position: 4, teamSearch: SearchTerm('River Plate')),
          Search(position: 5, teamSearch: SearchTerm('Boca Juniors')),
        );
        final searchHistoryModified = await searchRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'Boca Juniors',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '\tShould add a new term to the bottom of the search history list when the list is empty',
      () async {
        final searchHistoryModifiedExpected = KtList.of(
          Search(position: 0, teamSearch: SearchTerm('Sao Paulo')),
        );
        final searchHistoryModified = await searchRepository.insert(
          searchHistory: const KtList.empty(),
          teamSearch: 'Sao Paulo',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '\tShould return a database error when add a search history',
      () async {
        when(mockSearchDataSource.insert(any)).thenThrow(DatabaseException());
        final history = await searchRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'Sao Paulo',
        );
        expect(history, equals(left(SearchFailure.databaseError())));
      },
    );
  });
}
