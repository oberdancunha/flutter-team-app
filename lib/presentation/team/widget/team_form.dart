import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/team/team_form_search/team_form_search_bloc.dart';

class TeamForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamFormSearchBloc, TeamFormSearchState>(
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
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              key: const Key('team_search_text'),
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.search),
                labelText: 'Inform your favorite team',
              ),
              autocorrect: false,
              onChanged: (value) => context
                  .read<TeamFormSearchBloc>()
                  .add(TeamFormSearchEvent.changeTeam(value)),
              validator: (_) => context
                  .read<TeamFormSearchBloc>()
                  .state
                  .teamSearch
                  .value
                  .fold(
                    (error) => error.maybeMap(
                      empty: (_) => 'Team cannot be empty',
                      invalid: (_) => 'Team term is not valid',
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
              onFieldSubmitted: (value) {
                context
                    .read<TeamFormSearchBloc>()
                    .add(TeamFormSearchEvent.search(value));
              },
              enabled: !context.watch<TeamFormSearchBloc>().state.isSearching,
            ),
          ),
        );
      },
    );
  }
}