import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import 'search_history.dart';
import 'search_history_failures.dart';

abstract class ISearchHistoryRepository {
  Future<Either<SearchHistoryFailure, KtList<SearchHistory>>> list();
  KtList<SearchHistory> filter({
    @required KtList<SearchHistory> searchHistory,
    @required String teamSearch,
  });
  Future<Either<SearchHistoryFailure, KtList<SearchHistory>>> insert({
    @required KtList<SearchHistory> searchHistory,
    @required String teamSearch,
  });
}
