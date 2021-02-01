part of 'search_history_bloc.dart';

@freezed
abstract class SearchHistoryState with _$SearchHistoryState {
  const factory SearchHistoryState.initial() = _Initial;
  const factory SearchHistoryState.load() = _Load;
  const factory SearchHistoryState.success(KtList<Search> searchHistory) = _Success;
  const factory SearchHistoryState.failure(SearchFailure searchFailure) = _Failure;
}
