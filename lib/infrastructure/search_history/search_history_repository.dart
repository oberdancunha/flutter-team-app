import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import '../../core/errors/exceptions/database_exception.dart';
import '../../domain/search_history/i_search_history_data_source.dart';
import '../../domain/search_history/i_search_history_repository.dart';
import '../../domain/search_history/search_history.dart';
import '../../domain/search_history/search_history_failures.dart';
import 'search_history_dto.dart';

class SearchHistoryRepository implements ISearchHistoryRepository {
  final ISearchHistoryDataSource searchDataSource;
  static const int searchHistoryLength = 5;

  SearchHistoryRepository(this.searchDataSource);

  @override
  Future<Either<SearchHistoryFailure, KtList<SearchHistory>>> list() async {
    try {
      final searchHistoryListString = await searchDataSource.list();
      final searchHistory = searchHistoryListString
          .map(
            (history) => SearchHistoryDto.fromJson(
              jsonDecode(history) as Map<String, dynamic>,
            ).toDomain(),
          )
          .toImmutableList();
      return right(searchHistory);
    } on DatabaseException {
      return left(SearchHistoryFailure.databaseError());
    }
  }

  @override
  KtList<SearchHistory> filter({
    @required KtList<SearchHistory> searchHistory,
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
  Future<Either<SearchHistoryFailure, KtList<SearchHistory>>> insert({
    @required KtList<SearchHistory> searchHistory,
    @required String teamSearch,
  }) async {
    try {
      final searchHistoryDto = searchHistory
          .asList()
          .map(
            (history) => SearchHistoryDto.fromDomain(history),
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
      return left(SearchHistoryFailure.databaseError());
    }
  }

  List<SearchHistoryDto> _sortSearchHistory({
    @required List<SearchHistoryDto> searchHistory,
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
      SearchHistoryDto(
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
          (history) => SearchHistoryDto(
            position: --position,
            teamSearch: history.teamSearch,
          ),
        )
        .toList();
    return searchHistorySorted;
  }
}
