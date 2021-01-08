import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/team/team_form_search/team_form_search_bloc.dart';
import '../../../presentation/team/widget/team_result_details.dart';

class TeamResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamFormSearchBloc, TeamFormSearchState>(
      builder: (context, state) {
        return state.teamFailureOrSuccess.fold(
          () => Container(),
          (either) => either.fold(
            (_) => Container(),
            (team) => TeamResultDetails(team: team),
          ),
        );
      },
    );
  }
}
