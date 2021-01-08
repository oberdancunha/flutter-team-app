import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
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
          isSearching: false,
          activateSearchText: true,
          teamSearchingIsEmpty: e.teamSearch.isEmpty,
        );
      },
      search: (e) async* {
        yield state.copyWith(
          teamFailureOrSuccess: none(),
          isSearching: true,
          activateSearchText: false,
          teamSearchingIsEmpty: false,
        );
        final teamFailureOrSuccess =
            await _teamRepository.getDetails(e.teamSearch);
        yield state.copyWith(
          teamFailureOrSuccess: some(teamFailureOrSuccess),
          isSearching: false,
          activateSearchText: true,
          teamSearchingIsEmpty: false,
        );
      },
    );
  }
}
