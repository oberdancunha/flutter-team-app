import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_failures.freezed.dart';

@freezed
abstract class SearchFailure with _$SearchFailure {
  factory SearchFailure.databaseError() = _DatabaseError;
}
