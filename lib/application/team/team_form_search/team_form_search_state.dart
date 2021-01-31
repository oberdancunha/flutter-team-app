part of 'team_form_search_bloc.dart';

@freezed
abstract class TeamFormSearchState with _$TeamFormSearchState {
  const factory TeamFormSearchState({
    @required SearchTerm teamSearch,
    @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
    @required bool isSearching,
  }) = _TeamFormSearchState;
  factory TeamFormSearchState.initial() => TeamFormSearchState(
        teamSearch: SearchTerm(''),
        teamFailureOrSuccess: none(),
        isSearching: false,
      );
}
