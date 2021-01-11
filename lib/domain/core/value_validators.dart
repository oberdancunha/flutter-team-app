import 'package:dartz/dartz.dart';

import 'value_failures.dart';

Either<ValueFailure<String>, String> validateEmpty(String input) {
  if (input.trim().isNotEmpty) {
    return right(input);
  }
  return left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateInvalid(String input) {
  final searchRegex = RegExp(r'^[a-zA-Z0-9áàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$');
  if (searchRegex.hasMatch(input)) {
    return right(input);
  }
  return left(ValueFailure.invalid(failedValue: input));
}
