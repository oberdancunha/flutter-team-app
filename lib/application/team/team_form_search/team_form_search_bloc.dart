import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/core/value_sanitize.dart';
import '../../../domain/search/value_objects.dart';
import '../../../domain/teams/i_team_repository.dart';
import '../../../domain/teams/team.dart';

part 'team_form_search_bloc.freezed.dart';
part 'team_form_search_event.dart';
part 'team_form_search_state.dart';

class TeamFormSearchBloc
    extends Bloc<TeamFormSearchEvent, TeamFormSearchState> {
  final ITeamRepository _teamRepository;

  TeamFormSearchBloc(this._teamRepository)
      : super(TeamFormSearchState.initial());

  @override
  Stream<TeamFormSearchState> mapEventToState(
    TeamFormSearchEvent event,
  ) async* {
    yield* event.map(
      changeTeam: (e) async* {
        yield state.copyWith(
          teamFailureOrSuccess: none(),
          teamSearch: SearchText(e.teamSearch),
        );
      },
      search: (e) async* {
        Either<Failure, Team> teamFailureOrSuccess;
        if (state.teamSearch.isValid()) {
          yield state.copyWith(
            isSearching: true,
          );
          teamFailureOrSuccess = await _teamRepository.getDetails(
            removeExcessiveWhitspaces(e.teamSearch),
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
