import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../application/team/team_details/team_details_bloc.dart';
import '../../domain/search_history/search_history.dart';

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
      child: Column(
        children: [
          Text(
            'Search history',
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                childAspectRatio: 5.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              itemCount: searchHistory.size,
              itemBuilder: (context, index) {
                final teamSearch = searchHistory[index].teamSearch.getOrError();
                return GestureDetector(
                  key: Key(teamSearch),
                  onTap: () {
                    context.read<TeamDetailsBloc>().add(TeamDetailsEvent.changeTeam(teamSearch));
                  },
                  child: Text(
                    teamSearch,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
