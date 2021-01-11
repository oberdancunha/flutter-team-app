import 'package:dartz/dartz.dart';

import 'package:teamapp/domain/core/value_failures.dart';
import 'package:teamapp/domain/core/value_validators.dart';

import '../core/value_objects.dart';

class SearchText extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchText(String search) {
    assert(search != null);
    return SearchText._(validateEmpty(search).flatMap(validateInvalid));
  }

  const SearchText._(this.value);
}
