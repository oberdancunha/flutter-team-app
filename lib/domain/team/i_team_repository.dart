import 'package:dartz/dartz.dart';

import 'team.dart';
import 'team_failures.dart';

abstract class ITeamRepository {
  Future<Either<TeamFailure, Team>> getDetails(String team);
}
