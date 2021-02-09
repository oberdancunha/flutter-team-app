import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mockito/mockito.dart';
import 'package:teamapp/core/errors/exceptions/database_exception.dart';
import 'package:teamapp/domain/search_history/i_search_history_data_source.dart';
import 'package:teamapp/domain/search_history/search_history_failures.dart';
import 'package:teamapp/infrastructure/search_history/search_history_dto.dart';
import 'package:teamapp/infrastructure/search_history/search_history_repository.dart';

import '../../data/json_reader.dart';

class MockSearchHistoryDataSource extends Mock implements ISearchHistoryDataSource {}

void main() {
  MockSearchHistoryDataSource mockSearchHistoryDataSource;
  SearchHistoryRepository searchHistoryRepository;
  final searchHistoryJson = jsonReaderList('search/search_history.json');
  final searchHistory = searchHistoryJson
      .map(
        (history) => SearchHistoryDto.fromJson(history as Map<String, dynamic>).toDomain(),
      )
      .toImmutableList();
  final searchHistoryIncompleteJson = jsonReaderList('search/search_history_incomplete.json');
  final searchHistoryIncomplete = searchHistoryIncompleteJson
      .map(
        (history) => SearchHistoryDto.fromJson(history as Map<String, dynamic>).toDomain(),
      )
      .toImmutableList();

  setUp(
    () {
      mockSearchHistoryDataSource = MockSearchHistoryDataSource();
      searchHistoryRepository = SearchHistoryRepository(mockSearchHistoryDataSource);
    },
  );

  setUp(
    () {
      mockSearchHistoryDataSource = MockSearchHistoryDataSource();
      searchHistoryRepository = SearchHistoryRepository(mockSearchHistoryDataSource);
    },
  );

  group('All\n', () {
    test(
      '\tShould list search history inverted with success',
      () async {
        when(mockSearchHistoryDataSource.list()).thenAnswer(
          (_) async => searchHistory
              .asList()
              .map(
                (history) => json.encode(SearchHistoryDto.fromDomain(history)),
              )
              .toList(),
        );
        final history = await searchHistoryRepository.list();
        expect(history, equals(right(searchHistory)));
      },
    );

    test(
      '\tShould return an empty search history list',
      () async {
        when(mockSearchHistoryDataSource.list()).thenAnswer((_) async => List.empty());
        final history = await searchHistoryRepository.list();
        expect(history, equals(right(const KtList.empty())));
      },
    );

    test(
      '\tShould return a database error when retrieving all search history',
      () async {
        when(mockSearchHistoryDataSource.list()).thenThrow(DatabaseException());
        final history = await searchHistoryRepository.list();
        expect(history, equals(left(SearchHistoryFailure.databaseError())));
      },
    );
  });

  group('Filter\n', () {
    test(
      '\tShould return one result search history according to a term',
      () {
        const term = 'Sao';
        final searchHistoryFiltered = searchHistoryRepository.filter(
          searchHistory: searchHistory,
          teamSearch: term,
        );
        expect(
          searchHistoryFiltered,
          equals(
            [SearchHistoryDto(position: 4, teamSearch: 'Sao Paulo').toDomain()].toImmutableList(),
          ),
        );
      },
    );

    test(
      '\tShould return two results search history according to a term',
      () {
        const term = 'R';
        final searchHistoryFiltered = searchHistoryRepository.filter(
          searchHistory: searchHistory,
          teamSearch: term,
        );
        expect(
          searchHistoryFiltered,
          equals(
            [
              SearchHistoryDto(position: 2, teamSearch: 'Real Madrid').toDomain(),
              SearchHistoryDto(position: 0, teamSearch: 'River Plate').toDomain(),
            ].toImmutableList(),
          ),
        );
      },
    );
  });

  group('Insert\n', () {
    test(
      '''\tShould move an existing term to the bottom of the search history when the list already 
      contains the maximum number of terms''',
      () async {
        final searchHistoryModifiedExpected = [
          SearchHistoryDto(position: 4, teamSearch: 'River Plate').toDomain(),
          SearchHistoryDto(position: 3, teamSearch: 'Sao Paulo').toDomain(),
          SearchHistoryDto(position: 2, teamSearch: 'AC Milan').toDomain(),
          SearchHistoryDto(position: 1, teamSearch: 'Real Madrid').toDomain(),
          SearchHistoryDto(position: 0, teamSearch: 'Barcelona').toDomain(),
        ].toImmutableList();
        final searchHistoryModified = await searchHistoryRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'River Plate',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '''\tShould move an existing term to the bottom of the search history when the list not 
      contains the maximum number of terms''',
      () async {
        final searchHistoryModifiedExpected = [
          SearchHistoryDto(position: 2, teamSearch: 'River Plate').toDomain(),
          SearchHistoryDto(position: 1, teamSearch: 'Sao Paulo').toDomain(),
          SearchHistoryDto(position: 0, teamSearch: 'AC Milan').toDomain(),
        ].toImmutableList();
        final searchHistoryModified = await searchHistoryRepository.insert(
          searchHistory: searchHistoryIncomplete,
          teamSearch: 'River Plate',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '''\tShould add a new term to the bottom of the search history list when the list already 
    contains the maximum number of terms''',
      () async {
        final searchHistoryModifiedExpected = [
          SearchHistoryDto(position: 4, teamSearch: 'Boca Juniors').toDomain(),
          SearchHistoryDto(position: 3, teamSearch: 'Sao Paulo').toDomain(),
          SearchHistoryDto(position: 2, teamSearch: 'AC Milan').toDomain(),
          SearchHistoryDto(position: 1, teamSearch: 'Real Madrid').toDomain(),
          SearchHistoryDto(position: 0, teamSearch: 'Barcelona').toDomain(),
        ].toImmutableList();
        final searchHistoryModified = await searchHistoryRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'Boca Juniors',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '\tShould add a new term to the bottom of the search history list when the list is empty',
      () async {
        final searchHistoryModifiedExpected = [
          SearchHistoryDto(position: 0, teamSearch: 'Sao Paulo').toDomain(),
        ].toImmutableList();
        final searchHistoryModified = await searchHistoryRepository.insert(
          searchHistory: const KtList.empty(),
          teamSearch: 'Sao Paulo',
        );
        expect(searchHistoryModified, equals(right(searchHistoryModifiedExpected)));
      },
    );

    test(
      '\tShould return a database error when add a search history',
      () async {
        when(mockSearchHistoryDataSource.insert(any)).thenThrow(DatabaseException());
        final history = await searchHistoryRepository.insert(
          searchHistory: searchHistory,
          teamSearch: 'Sao Paulo',
        );
        expect(history, equals(left(SearchHistoryFailure.databaseError())));
      },
    );
  });
}
