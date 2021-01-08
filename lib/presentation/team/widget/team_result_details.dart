import 'package:flutter/material.dart';

import '../../../domain/teams/team.dart';
import 'team_details.dart';
import 'team_not_found.dart';

class TeamResultDetails extends StatelessWidget {
  final Team team;

  const TeamResultDetails({
    Key key,
    @required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (team.id == 0) {
      return TeamNotFound();
    } else {
      return TeamDetails(team: team);
    }
  }
}
