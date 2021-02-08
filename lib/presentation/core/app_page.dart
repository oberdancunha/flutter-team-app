import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/search/search_history/search_history_bloc.dart';
import '../../application/team/team_form_search/team_form_search_bloc.dart';
import 'app_search_team.dart';

class AppPage extends StatelessWidget {
  final TeamFormSearchBloc teamFormSearchBloc;
  final SearchHistoryBloc searchHistoryBloc;

  const AppPage({
    Key key,
    @required this.teamFormSearchBloc,
    @required this.searchHistoryBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Team app'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => teamFormSearchBloc),
          BlocProvider(
            create: (context) => searchHistoryBloc..add(const SearchHistoryEvent.list()),
          ),
        ],
        child: AppSearchTeam(),
      ),
    );
  }
}
