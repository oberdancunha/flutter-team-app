import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/search/search_history/search_history_bloc.dart';
import '../../../application/team/team_details/team_details_bloc.dart';

class SearchFormWidget extends StatefulWidget {
  final Function() onTap;

  const SearchFormWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  _SearchFormWidgetState createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  TextEditingController teamSearchController;

  @override
  void initState() {
    teamSearchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    teamSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamDetailsBloc, TeamDetailsState>(
      buildWhen: (previous, current) => previous.teamSearch != current.teamSearch,
      builder: (context, state) {
        teamSearchController
          ..text = state.teamSearch.value.fold(
            (failure) => failure.failedValue,
            (teamSearch) => teamSearch,
          )
          ..selection = state.teamSearch.value.fold(
              (failure) => TextSelection.fromPosition(
                    TextPosition(
                      offset: failure.failedValue.length,
                    ),
                  ),
              (teamSearch) => TextSelection.fromPosition(TextPosition(offset: teamSearch.length)));
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
                color: Colors.red,
                icon: const Icon(
                  Icons.remove_circle,
                ),
                onPressed: teamSearchController.text.isNotEmpty
                    ? () => context.read<TeamDetailsBloc>().add(
                          const TeamDetailsEvent.changeTeam(''),
                        )
                    : null,
              ),
            ),
            autocorrect: false,
            onChanged: (teamSearch) {
              context.read<TeamDetailsBloc>().add(TeamDetailsEvent.changeTeam(teamSearch));
              context.read<SearchHistoryBloc>().add(
                    SearchHistoryEvent.filter(
                      context.read<SearchHistoryBloc>().state.maybeMap(
                            success: (success) => success.searchHistory,
                            orElse: () => const KtList.empty(),
                          ),
                      context.read<SearchHistoryBloc>().state.maybeMap(
                            success: (success) => success.searchHistoryPersistent,
                            orElse: () => const KtList.empty(),
                          ),
                      teamSearch,
                    ),
                  );
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
                            success: (success) => success.searchHistory,
                            orElse: () => const KtList.empty(),
                          ),
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
          ),
        );
      },
    );
  }
}
