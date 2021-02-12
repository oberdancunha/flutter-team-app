part of 'search_history_bloc.dart';

@freezed
abstract class SearchHistoryEvent with _$SearchHistoryEvent {
  const factory SearchHistoryEvent.list() = _List;
  const factory SearchHistoryEvent.filter(
    KtList<SearchHistory> searchHistory,
    String teamSearch,
  ) = _Filter;
  const factory SearchHistoryEvent.insert(
    KtList<SearchHistory> searchHistory,
    String teamSearch,
  ) = _Insert;
}
