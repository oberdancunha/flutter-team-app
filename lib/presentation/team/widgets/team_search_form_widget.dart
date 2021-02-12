import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/search/search_history/search_history_bloc.dart';
import '../../../application/team/team_details/team_details_bloc.dart';

class TeamSearchFormWidget extends StatefulWidget {
  final Function() onTap;

  const TeamSearchFormWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  _TeamSearchFormWidgetState createState() => _TeamSearchFormWidgetState();
}

class _TeamSearchFormWidgetState extends State<TeamSearchFormWidget> {
  TextEditingController teamSearchController;
  FocusNode teamSearchFocus;

  @override
  void initState() {
    super.initState();
    teamSearchController = TextEditingController();
    teamSearchFocus = FocusNode();
  }

  @override
  void dispose() {
    teamSearchController.dispose();
    teamSearchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamDetailsBloc, TeamDetailsState>(
      buildWhen: (previous, current) {
        teamSearchFocus.requestFocus();
        return previous.teamSearch != current.teamSearch;
      },
      builder: (context, state) {
        final teamSearch = state.teamSearch.value.fold(
          (failure) => failure.failedValue,
          (teamSearch) => teamSearch,
        );
        teamSearchController
          ..text = teamSearch
          ..selection = TextSelection.fromPosition(
            TextPosition(
              offset: teamSearch.length,
            ),
          );
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            key: const Key('team_search_text'),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              prefixIcon: const Icon(Icons.search),
              labelText: 'Inform your favorite team',
              suffixIcon: IconButton(
                key: const Key('clear_team_search'),
                color: Colors.red,
                icon: const Icon(
                  Icons.remove_circle,
                ),
                onPressed: teamSearchController.text.isNotEmpty
                    ? () => _changeTeamSearch(context: context, teamSearch: '')
                    : null,
              ),
            ),
            autocorrect: false,
            onChanged: (teamSearch) {
              _changeTeamSearch(context: context, teamSearch: teamSearch);
            },
            validator: (_) => context.read<TeamDetailsBloc>().state.teamSearch.value.fold(
                  (error) => error.maybeMap(
                    empty: (_) => 'Team cannot be empty',
                    invalid: (_) => 'Team term is not valid',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
            onFieldSubmitted: (teamSearch) {
              context.read<TeamDetailsBloc>().add(TeamDetailsEvent.search(teamSearch));
              context.read<SearchHistoryBloc>().add(
                    SearchHistoryEvent.insert(
                      context.read<SearchHistoryBloc>().state.maybeMap(
                            success: (success) => success.searchHistoryPersistent,
                            orElse: () => const KtList.empty(),
                          ),
                      teamSearch,
                    ),
                  );
            },
            enabled: !context.watch<TeamDetailsBloc>().state.isSearching,
            onTap: widget.onTap,
            controller: teamSearchController,
            focusNode: teamSearchFocus,
          ),
        );
      },
    );
  }
}

void _changeTeamSearch({
  @required BuildContext context,
  @required String teamSearch,
}) {
  context.read<TeamDetailsBloc>().add(TeamDetailsEvent.changeTeam(teamSearch));
  context.read<SearchHistoryBloc>().add(
        SearchHistoryEvent.filter(
          context.read<SearchHistoryBloc>().state.maybeMap(
                success: (success) => success.searchHistoryPersistent,
                orElse: () => const KtList.empty(),
              ),
          teamSearch,
        ),
      );
}
