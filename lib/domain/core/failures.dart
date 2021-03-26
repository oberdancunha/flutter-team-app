import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError() = _ServerError;
  const factory Failure.isNotConnected() = _IsNotConnected;
}