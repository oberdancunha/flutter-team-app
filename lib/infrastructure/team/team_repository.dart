import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/errors/exceptions/server_exception.dart';
import '../../core/network/i_network_info.dart';
import '../../domain/team/i_team_data_source.dart';
import '../../domain/team/i_team_repository.dart';
import '../../domain/team/team.dart';
import '../../domain/team/team_failures.dart';

class TeamRepository implements ITeamRepository {
  final ITeamDataSource teamDataSource;
  final INetworkInfo networkInfo;

  TeamRepository({
    @required this.teamDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<TeamFailure, Team>> getDetails(String teamSearch) async {
    if (await networkInfo.isConnected) {
      try {
        final team = await teamDataSource.getDetails(teamSearch);
        return right(team);
      } on ServerException {
        return left(const TeamFailure.serverError());
      }
    } else {
      return left(const TeamFailure.isNotConnected());
    }
  }
}
