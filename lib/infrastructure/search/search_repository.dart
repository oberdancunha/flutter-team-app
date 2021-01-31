import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import '../../core/errors/exceptions/database_exception.dart';
import '../../domain/search/i_search_data_source.dart';
import '../../domain/search/i_search_repository.dart';
import '../../domain/search/search.dart';
import '../../domain/search/search_failures.dart';
import 'search_dto.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource searchDataSource;
  static const int searchHistoryLength = 5;

  SearchRepository(this.searchDataSource);

  @override
  Future<Either<SearchFailure, KtList<Search>>> list() async {
    try {
      final searchHistoryListString = await searchDataSource.list();
      final searchHistory = searchHistoryListString
          .map(
            (history) => SearchDto.fromJson(
              jsonDecode(history) as Map<String, dynamic>,
            ).toDomain(),
          )
          .toImmutableList();
      return right(searchHistory);
    } on DatabaseException {
      return left(SearchFailure.databaseError());
    }
  }

  @override
  KtList<Search> filter({
    @required KtList<Search> searchHistory,
    @required String term,
  }) {
    return searchHistory
        .reversed()
        .asList()
        .where(
          (searchHistory) => searchHistory.term.getOrError().startsWith(term),
        )
        .toImmutableList();
  }

  @override
  Future<Either<SearchFailure, KtList<Search>>> insert({
    @required KtList<Search> searchHistory,
    @required String term,
  }) async {
    try {
      final searchHistoryDto = searchHistory
          .map(
            (history) => SearchDto.fromDomain(history),
          )
          .asList();
      final searchHistoryModified = _sortSearchHistory(
        searchHistory: searchHistoryDto,
        term: term,
      );
      await searchDataSource.insert(
        searchHistoryModified
            .map(
              (history) => json.encode(searchHistoryModified),
            )
            .toList(),
      );
      return right(
        searchHistoryModified
            .map(
              (history) => history.toDomain(),
            )
            .toImmutableList(),
      );
    } on DatabaseException {
      return left(SearchFailure.databaseError());
    }
  }

  List<SearchDto> _sortSearchHistory({
    @required List<SearchDto> searchHistory,
    @required String term,
  }) {
    if (searchHistory.contains(term)) {
      searchHistory.removeWhere(
        (history) => history.term.toLowerCase() == term.toLowerCase(),
      );
    }
    searchHistory.add(
      SearchDto(
        position: searchHistory.isNotEmpty ? searchHistory.last.position + 1 : 0,
        term: term,
      ),
    );
    if (searchHistory.length > searchHistoryLength) {
      searchHistory.removeRange(
        0,
        searchHistory.length - searchHistoryLength,
      );
    }
    return searchHistory;
  }
}
