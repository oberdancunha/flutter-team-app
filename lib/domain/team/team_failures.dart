import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_failures.freezed.dart';

@freezed
abstract class TeamFailure with _$TeamFailure {
  const factory TeamFailure.serverError() = _ServerError;
  const factory TeamFailure.isNotConnected() = _IsNotConnected;
}
