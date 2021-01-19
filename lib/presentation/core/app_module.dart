import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../application/team/team_form_search/team_form_search_bloc.dart';
import '../../core/network/i_network_info.dart';
import '../../domain/core/value_sanitize.dart';
import '../../domain/teams/i_team_data_source.dart';
import '../../domain/teams/i_team_repository.dart';
import '../../infrastructure/core/network/network_info_data_connection_checker.dart';
import '../../infrastructure/team/team_data_source_dio.dart';
import '../../infrastructure/team/team_repository.dart';
import '../team/team_page.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ITeamRepository>(
          (i) => TeamRepository(
            teamDataSource: i.get<TeamDataSourceDio>(),
            networkInfo: i.get<NetworkInfoDataConnectionChecker>(),
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
            teamRepository: i.get<TeamRepository>(),
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
          child: (_, __) => TeamPage(
            teamFormSearchBloc: Modular.get<TeamFormSearchBloc>(),
          ),
        ),
      ];
}
