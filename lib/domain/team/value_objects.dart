import 'package:dartz/dartz.dart';

import '../core/value_failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class SearchTerm extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchTerm(String term) {
    assert(term != null);
    return SearchTerm._(validateEmpty(term).flatMap(validateInvalid));
  }

  const SearchTerm._(this.value);
}
