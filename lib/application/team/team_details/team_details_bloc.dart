import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/value_sanitize.dart';
import '../../../domain/team/i_team_repository.dart';
import '../../../domain/team/team.dart';
import '../../../domain/team/team_failures.dart';
import '../../../domain/team/value_objects.dart';

part 'team_details_bloc.freezed.dart';
part 'team_details_event.dart';
part 'team_details_state.dart';

class TeamDetailsBloc extends Bloc<TeamDetailsEvent, TeamDetailsState> {
  final ITeamRepository teamRepository;
  final ValueSanitize valueSanitize;

  TeamDetailsBloc({
    @required this.teamRepository,
    @required this.valueSanitize,
  }) : super(TeamDetailsState.initial());

  @override
  Stream<TeamDetailsState> mapEventToState(
    TeamDetailsEvent event,
  ) async* {
    yield* event.map(
      changeTeam: (e) async* {
        yield state.copyWith(
          teamFailureOrSuccess: none(),
          teamSearch: SearchTerm(e.teamSearch),
        );
      },
      search: (e) async* {
        Either<TeamFailure, Team> teamFailureOrSuccess;
        if (state.teamSearch.isValid()) {
          final teamSearch = valueSanitize.removeExcessiveWhiteSpaces(
            e.teamSearch,
          );
          yield state.copyWith(
            isSearching: true,
          );
          teamFailureOrSuccess = await teamRepository.getDetails(
            teamSearch,
          );
        }
        yield state.copyWith(
          teamFailureOrSuccess: optionOf(teamFailureOrSuccess),
          isSearching: false,
        );
      },
    );
  }
}
