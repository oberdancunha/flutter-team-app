import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import 'team.dart';

abstract class ITeamRepository {
  Future<Either<Failure, Team>> getDetails(String team);
}
