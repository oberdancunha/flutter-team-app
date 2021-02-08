import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../application/search/search_history/search_history_bloc.dart';
import '../../application/team/team_form_search/team_form_search_bloc.dart';
import '../../core/network/i_network_info.dart';
import '../../domain/core/value_sanitize.dart';
import '../../domain/search/i_search_data_source.dart';
import '../../domain/search/i_search_repository.dart';
import '../../domain/team/i_team_data_source.dart';
import '../../domain/team/i_team_repository.dart';
import '../../infrastructure/core/network/network_info_data_connection_checker.dart';
import '../../infrastructure/search/search_data_source_sp.dart';
import '../../infrastructure/search/search_repository.dart';
import '../../infrastructure/team/team_data_source_dio.dart';
import '../../infrastructure/team/team_repository.dart';
import 'app_page.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ITeamRepository>(
          (i) => TeamRepository(
            teamDataSource: i.get<ITeamDataSource>(),
            networkInfo: i.get<INetworkInfo>(),
          ),
        ),
        Bind<INetworkInfo>(
          (i) => NetworkInfoDataConnectionChecker(
            i.get<DataConnectionChecker>(),
          ),
        ),
        Bind<DataConnectionChecker>((i) => DataConnectionChecker()),
        Bind<ITeamDataSource>((i) => TeamDataSourceDio(client: i.get<Dio>())),
        Bind<Dio>((i) => Dio()),
        Bind<ValueSanitize>((i) => ValueSanitize()),
        Bind<TeamFormSearchBloc>(
          (i) => TeamFormSearchBloc(
            teamRepository: i.get<ITeamRepository>(),
            valueSanitize: i.get<ValueSanitize>(),
          ),
        ),
        Bind<ISearchDataSource>((i) => SearchDataSourceSP(null)),
        Bind<ISearchRepository>((i) => SearchRepository(i.get<ISearchDataSource>())),
        Bind<SearchHistoryBloc>(
          (i) => SearchHistoryBloc(
            searchRepository: i.get<ISearchRepository>(),
            valueSanitize: i.get<ValueSanitize>(),
          ),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, __) => AppPage(
            teamFormSearchBloc: Modular.get<TeamFormSearchBloc>(),
            searchHistoryBloc: Modular.get<SearchHistoryBloc>(),
          ),
        ),
      ];
}
