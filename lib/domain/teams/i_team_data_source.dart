import 'team.dart';

abstract class ITeamDataSource {
  Future<Team> getDetails(String teamSearch);
}
