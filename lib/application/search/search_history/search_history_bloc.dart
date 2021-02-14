import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/core/value_sanitize.dart';
import '../../../domain/search_history/i_search_history_repository.dart';
import '../../../domain/search_history/search_history.dart';
import '../../../domain/search_history/search_history_failures.dart';
import '../../../domain/team/value_objects.dart';

part 'search_history_bloc.freezed.dart';
part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final ISearchHistoryRepository searchHistoryRepository;
  final ValueSanitize valueSanitize;

  SearchHistoryBloc({
    @required this.searchHistoryRepository,
    @required this.valueSanitize,
  }) : super(const _Initial());

  @override
  Stream<SearchHistoryState> mapEventToState(
    SearchHistoryEvent event,
  ) async* {
    yield* event.map(
      list: (e) async* {
        yield const SearchHistoryState.load();
        final searchHistory = await searchHistoryRepository.list();
        yield searchHistory.fold(
          (searchFailure) => SearchHistoryState.failure(searchFailure),
          (searchHistory) => SearchHistoryState.success(
            searchHistory,
            searchHistory,
          ),
        );
      },
      filter: (e) async* {
        yield const SearchHistoryState.load();
        final teamSearch = valueSanitize.removeExcessiveWhiteSpaces(e.teamSearch);
        final searchHistory = searchHistoryRepository.filter(
          searchHistory: e.searchHistory,
          teamSearch: teamSearch,
        );
        yield SearchHistoryState.success(
          searchHistory,
          e.searchHistory,
        );
      },
      insert: (e) async* {
        final teamSearchValidate = SearchTerm(e.teamSearch);
        if (teamSearchValidate.isValid()) {
          yield const SearchHistoryState.load();
          final teamSearch = valueSanitize.removeExcessiveWhiteSpaces(
            teamSearchValidate.getOrError(),
          );
          final searchHistoryInserted = await searchHistoryRepository.insert(
            searchHistory: e.searchHistory,
            teamSearch: teamSearch,
          );
          yield searchHistoryInserted.fold(
            (searchFailure) => SearchHistoryState.failure(searchFailure),
            (searchHistory) => SearchHistoryState.success(
              searchHistory,
              searchHistory,
            ),
          );
        }
      },
    );
  }
}
