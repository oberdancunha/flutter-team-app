import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/team/team_details/team_details_bloc.dart';
import '../search/search_page.dart';
import '../team/team_page.dart';

class AppSearchTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamDetailsBloc, TeamDetailsState>(
      listener: (context, state) {
        state.teamFailureOrSuccess.fold(
          () => {},
          (either) => either.fold(
            (failure) => {
              FlushbarHelper.createError(
                message: failure.map(
                  serverError: (_) => 'Server error',
                  isNotConnected: (_) => 'Device is not connected',
                ),
              ).show(context),
            },
            (_) => null,
          ),
        );
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchPage(),
            const SizedBox(height: 35.0),
            if (state.isSearching)
              const Center(child: CircularProgressIndicator())
            else
              state.teamFailureOrSuccess.fold(
                () => Container(),
                (either) => either.fold(
                  (_) => Container(),
                  (team) => TeamPage(team: team),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
