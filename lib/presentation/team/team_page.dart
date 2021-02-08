import 'package:flutter/material.dart';
import 'package:teamapp/domain/team/team.dart';

import 'widgets/team_details_widget.dart';
import 'widgets/team_not_found_widget.dart';

class TeamPage extends StatelessWidget {
  final Team team;

  const TeamPage({
    Key key,
    @required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (team.id == 0) {
      return TeamNotFoundWidget();
    } else {
      return Expanded(child: TeamDetailsWidget(team: team));
    }
  }
}
