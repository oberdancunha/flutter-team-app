import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../application/search/search_history/search_history_bloc.dart';
import '../../application/team/team_details/team_details_bloc.dart';
import '../../core/network/i_network_info.dart';
import '../../domain/core/value_sanitize.dart';
import '../../domain/search_history/i_search_history_data_source.dart';
import '../../domain/search_history/i_search_history_repository.dart';
import '../../domain/team/i_team_data_source.dart';
import '../../domain/team/i_team_repository.dart';
import '../../infrastructure/core/network/network_info_data_connection_checker.dart';
import '../../infrastructure/search_history/search_history_data_source_sp.dart';
import '../../infrastructure/search_history/search_history_repository.dart';
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
        Bind<TeamDetailsBloc>(
          (i) => TeamDetailsBloc(
            teamRepository: i.get<ITeamRepository>(),
            valueSanitize: i.get<ValueSanitize>(),
          ),
        ),
        Bind<ISearchHistoryDataSource>((i) => SearchHistoryDataSourceSP(null)),
        Bind<ISearchHistoryRepository>((i) => SearchHistoryRepository(
              i.get<ISearchHistoryDataSource>(),
            )),
        Bind<SearchHistoryBloc>(
          (i) => SearchHistoryBloc(
            searchHistoryRepository: i.get<ISearchHistoryRepository>(),
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
            teamDetailsBloc: Modular.get<TeamDetailsBloc>(),
            searchHistoryBloc: Modular.get<SearchHistoryBloc>(),
          ),
        ),
      ];
}
