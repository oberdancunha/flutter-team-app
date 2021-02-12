import 'package:freezed_annotation/freezed_annotation.dart';
import '../team/value_objects.dart';

part 'search_history.freezed.dart';

@freezed
abstract class SearchHistory with _$SearchHistory {
  const SearchHistory._();

  factory SearchHistory({
    @required int position,
    @required SearchTerm teamSearch,
  }) = _SearchHistory;
}
