import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/search/search_history/search_history_bloc.dart';
import '../../../application/team/team_form_search/team_form_search_bloc.dart';

class SearchFormWidget extends StatelessWidget {
  final Function() onTap;

  const SearchFormWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamFormSearchBloc, TeamFormSearchState>(
      builder: (context, state) => Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          key: const Key('team_search_text'),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            prefixIcon: const Icon(Icons.search),
            labelText: 'Inform your favorite team',
          ),
          autocorrect: false,
          onChanged: (teamSearch) {
            context.read<TeamFormSearchBloc>().add(TeamFormSearchEvent.changeTeam(teamSearch));
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
          validator: (_) => context.read<TeamFormSearchBloc>().state.teamSearch.value.fold(
                (error) => error.maybeMap(
                  empty: (_) => 'Team cannot be empty',
                  invalid: (_) => 'Team term is not valid',
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onFieldSubmitted: (teamSearch) {
            context.read<TeamFormSearchBloc>().add(TeamFormSearchEvent.search(teamSearch));
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
          enabled: !context.watch<TeamFormSearchBloc>().state.isSearching,
          onTap: onTap,
        ),
      ),
    );
  }
}
