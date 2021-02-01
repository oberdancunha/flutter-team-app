import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/search/search.dart';
import '../../domain/search/value_objects.dart';

part 'search_dto.freezed.dart';
part 'search_dto.g.dart';

@freezed
@SearchDtoConverter()
abstract class SearchDto with _$SearchDto {
  const SearchDto._();

  factory SearchDto({
    @required int position,
    @required String teamSearch,
  }) = _SearchDto;

  factory SearchDto.fromJson(Map<String, dynamic> searchHistoryJson) =>
      _$SearchDtoFromJson(searchHistoryJson);

  factory SearchDto.fromDomain(Search searchHistory) => SearchDto(
        position: searchHistory.position,
        teamSearch: searchHistory.teamSearch.getOrError(),
      );

  Search toDomain() => Search(
        position: position,
        teamSearch: SearchTerm(teamSearch),
      );
}

class SearchDtoConverter implements JsonConverter<SearchDto, Map<String, dynamic>> {
  const SearchDtoConverter();

  @override
  SearchDto fromJson(Map<String, dynamic> searchHistoryJson) =>
      SearchDto.fromJson(searchHistoryJson);

  @override
  Map<String, dynamic> toJson(SearchDto searchHistoryData) => searchHistoryData.toJson();
}
