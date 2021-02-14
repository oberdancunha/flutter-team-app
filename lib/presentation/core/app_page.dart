import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/search/search_history/search_history_bloc.dart';
import '../../application/team/team_details/team_details_bloc.dart';
import '../team/team_page.dart';

class AppPage extends StatelessWidget {
  final TeamDetailsBloc teamDetailsBloc;
  final SearchHistoryBloc searchHistoryBloc;

  const AppPage({
    Key key,
    @required this.teamDetailsBloc,
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
          BlocProvider(create: (context) => teamDetailsBloc),
          BlocProvider(
            create: (context) => searchHistoryBloc..add(const SearchHistoryEvent.list()),
          ),
        ],
        child: TeamPage(),
      ),
    );
  }
}
