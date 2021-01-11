import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({@required T failedValue}) = Empty<T>;
  const factory ValueFailure.invalid({@required T failedValue}) = Invalid<T>;
}
