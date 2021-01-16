import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/domain/core/value_failures.dart';
import 'package:teamapp/domain/search/value_objects.dart';

void main() {
  group('SearchText', () {
    test(
      'Should validate text without problem',
      () {
        const input = 'Sao Paulo';
        final inputValidate = SearchText(input);
        expect(inputValidate.value, equals(right(input)));
      },
    );

    test(
      'Should validate empty text',
      () {
        const input = ' ';
        final inputValidate = SearchText(input);
        expect(
          inputValidate.value,
          equals(
            left(const ValueFailure.empty(failedValue: input)),
          ),
        );
      },
    );

    test(
      'Should validate invalid text',
      () {
        const input = '*&@!';
        final inputValidate = SearchText(input);
        expect(
          inputValidate.value,
          equals(
            left(
              const ValueFailure.invalid(failedValue: input),
            ),
          ),
        );
      },
    );
  });
}
