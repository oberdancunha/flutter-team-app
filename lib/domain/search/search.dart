import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teamapp/domain/search/value_objects.dart';

part 'search.freezed.dart';

@freezed
abstract class Search with _$Search {
  const Search._();

  factory Search({
    @required int position,
    @required SearchTerm term,
  }) = _Search;

  factory Search.empty() => Search(
        position: 0,
        term: SearchTerm(''),
      );
}
