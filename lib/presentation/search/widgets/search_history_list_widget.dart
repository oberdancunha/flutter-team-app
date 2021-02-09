import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/team/team_details/team_details_bloc.dart';
import '../../../domain/search_history/search_history.dart';

class SearchHistoryListWidget extends StatelessWidget {
  final KtList<SearchHistory> searchHistory;

  const SearchHistoryListWidget({
    Key key,
    @required this.searchHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: searchHistory.size == 0
          ? const Center(
              child: Text(
                'There is not search history',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            )
          : Column(
              children: [
                Text(
                  'Search history',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 3.0),
                    itemCount: searchHistory.size,
                    itemBuilder: (_, index) {
                      final teamSearch = searchHistory[index].teamSearch.getOrError();
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<TeamDetailsBloc>()
                              .add(TeamDetailsEvent.changeTeam(teamSearch));
                        },
                        child: Text(
                          teamSearch,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
    );
  }
}
