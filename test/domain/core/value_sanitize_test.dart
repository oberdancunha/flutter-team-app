import 'package:flutter_test/flutter_test.dart';
import 'package:teamapp/domain/core/value_sanitize.dart';

void main() {
  ValueSanitize valueSanitize;
  const correctFinalValue = 'Sao Paulo';

  setUp(() {
    valueSanitize = ValueSanitize();
  });

  test('Should call for the sanitization of excessive spaces', () {
    const valueProblem = '     Sao       Paulo       ';
    final sanitizedValue =
        valueSanitize.removeExcessiveWhiteSpaces(valueProblem);
    expect(sanitizedValue, equals(correctFinalValue));
  });
}
