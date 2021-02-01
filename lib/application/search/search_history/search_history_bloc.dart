import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/core/value_sanitize.dart';
import '../../../domain/search/i_search_repository.dart';
import '../../../domain/search/search.dart';
import '../../../domain/search/search_failures.dart';

part 'search_history_bloc.freezed.dart';
part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final ISearchRepository searchRepository;
  final ValueSanitize valueSanitize;

  SearchHistoryBloc({
    @required this.searchRepository,
    @required this.valueSanitize,
  }) : super(const _Initial());

  @override
  Stream<SearchHistoryState> mapEventToState(
    SearchHistoryEvent event,
  ) async* {
    yield* event.map(
      list: (e) async* {
        yield const SearchHistoryState.load();
        final searchHistory = await searchRepository.list();
        yield searchHistory.fold(
          (searchFailure) => SearchHistoryState.failure(searchFailure),
          (searchHistory) => SearchHistoryState.success(searchHistory),
        );
      },
      filter: (e) async* {
        yield const SearchHistoryState.load();
        final teamSearch = valueSanitize.removeExcessiveWhiteSpaces(e.teamSearch);
        final searchHistory = searchRepository.filter(
          searchHistory: e.searchHistory,
          teamSearch: teamSearch,
        );
        yield SearchHistoryState.success(searchHistory);
      },
      insert: (e) async* {
        yield const SearchHistoryState.load();
        final teamSearch = valueSanitize.removeExcessiveWhiteSpaces(e.teamSearch);
        final insert = await searchRepository.insert(
          searchHistory: e.searchHistory,
          teamSearch: teamSearch,
        );
        yield insert.fold(
          (searchFailure) => SearchHistoryState.failure(searchFailure),
          (searchHistory) => SearchHistoryState.success(searchHistory),
        );
      },
    );
  }
}
