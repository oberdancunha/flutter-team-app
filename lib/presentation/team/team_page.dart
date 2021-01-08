import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/team/team_form_search/team_form_search_bloc.dart';
import 'widget/team_form_result.dart';

class TeamPage extends StatelessWidget {
  final TeamFormSearchBloc teamFormSearchBloc;

  const TeamPage({
    Key key,
    @required this.teamFormSearchBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Team app'),
      ),
      body: BlocProvider(
        create: (context) => teamFormSearchBloc,
        child: TeamFormResult(),
      ),
    );
  }
}
