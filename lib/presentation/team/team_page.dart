import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/team/team_details/team_details_bloc.dart';
import 'widgets/team_result_widget.dart';
import 'widgets/team_search_widget.dart';

class TeamPage extends StatelessWidget {
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TeamSearchWidget(),
            if (state.isSearching)
              const Center(child: CircularProgressIndicator())
            else
              state.teamFailureOrSuccess.fold(
                () => Container(),
                (either) => either.fold(
                  (_) => Container(),
                  (team) => TeamResultWidget(team: team),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
