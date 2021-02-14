import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/search_history/search_history.dart';
import '../../domain/team/value_objects.dart';

part 'search_history_dto.freezed.dart';
part 'search_history_dto.g.dart';

@freezed
@SearchHistoryDtoConverter()
abstract class SearchHistoryDto with _$SearchHistoryDto {
  const SearchHistoryDto._();

  factory SearchHistoryDto({
    @required int position,
    @required String teamSearch,
  }) = _SearchHistoryDto;

  factory SearchHistoryDto.fromJson(Map<String, dynamic> searchHistoryJson) =>
      _$SearchHistoryDtoFromJson(searchHistoryJson);

  factory SearchHistoryDto.fromDomain(SearchHistory searchHistory) => SearchHistoryDto(
        position: searchHistory.position,
        teamSearch: searchHistory.teamSearch.getOrError(),
      );

  SearchHistory toDomain() => SearchHistory(
        position: position,
        teamSearch: SearchTerm(teamSearch),
      );
}

class SearchHistoryDtoConverter implements JsonConverter<SearchHistoryDto, Map<String, dynamic>> {
  const SearchHistoryDtoConverter();

  @override
  SearchHistoryDto fromJson(Map<String, dynamic> searchHistoryJson) =>
      SearchHistoryDto.fromJson(searchHistoryJson);

  @override
  Map<String, dynamic> toJson(SearchHistoryDto searchHistoryData) => searchHistoryData.toJson();
}
