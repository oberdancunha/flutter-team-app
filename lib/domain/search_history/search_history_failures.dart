import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_failures.freezed.dart';

@freezed
abstract class SearchHistoryFailure with _$SearchHistoryFailure {
  factory SearchHistoryFailure.databaseError() = _DatabaseError;
}
