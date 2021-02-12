import 'package:flutter/material.dart';
import 'package:teamapp/domain/team/team.dart';

import 'team_details_widget.dart';
import 'team_not_found_widget.dart';

class TeamResultWidget extends StatelessWidget {
  final Team team;

  const TeamResultWidget({
    Key key,
    @required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (team.id == 0) {
      return TeamNotFoundWidget();
    } else {
      return TeamDetailsWidget(team: team);
    }
  }
}
