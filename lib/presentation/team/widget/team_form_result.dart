import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/team/team_form_search/team_form_search_bloc.dart';
import 'team_form.dart';
import 'team_result.dart';

class TeamFormResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamFormSearchBloc, TeamFormSearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TeamForm(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isSearching)
                    const CircularProgressIndicator()
                  else
                    TeamResult(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
