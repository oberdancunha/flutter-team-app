import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

import 'search.dart';
import 'search_failures.dart';

abstract class ISearchRepository {
  Future<Either<SearchFailure, KtList<Search>>> list();
  KtList<Search> filter({
    @required KtList<Search> searchHistory,
    @required String teamSearch,
  });
  Future<Either<SearchFailure, KtList<Search>>> insert({
    @required KtList<Search> searchHistory,
    @required String teamSearch,
  });
}
