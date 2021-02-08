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
    @required String teamSearch,
  }) {
    return searchHistory
        .asList()
        .where(
          (searchHistory) => searchHistory.teamSearch.getOrError().startsWith(teamSearch),
        )
        .toImmutableList();
  }

  @override
  Future<Either<SearchFailure, KtList<Search>>> insert({
    @required KtList<Search> searchHistory,
    @required String teamSearch,
  }) async {
    try {
      final searchHistoryDto = searchHistory
          .asList()
          .map(
            (history) => SearchDto.fromDomain(history),
          )
          .toList();
      final searchHistoryModified = _sortSearchHistory(
        searchHistory: searchHistoryDto.reversed.toList(),
        teamSearch: teamSearch,
      );
      await searchDataSource.insert(
        searchHistoryModified
            .map(
              (history) => json.encode(history),
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
    @required String teamSearch,
  }) {
    final contains = searchHistory.singleWhere(
      (history) => history.teamSearch.toLowerCase() == teamSearch.toLowerCase(),
      orElse: () => null,
    );
    if (contains != null) {
      searchHistory.removeWhere(
        (history) => history.teamSearch.toLowerCase() == teamSearch.toLowerCase(),
      );
    }
    searchHistory.add(
      SearchDto(
        position: 0,
        teamSearch: teamSearch,
      ),
    );
    if (searchHistory.length > searchHistoryLength) {
      searchHistory.removeRange(
        0,
        searchHistory.length - searchHistoryLength,
      );
    }
    int position = searchHistory.length;
    final searchHistorySorted = searchHistory.reversed
        .map(
          (history) => SearchDto(
            position: --position,
            teamSearch: history.teamSearch,
          ),
        )
        .toList();
    return searchHistorySorted;
  }
}
