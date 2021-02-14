part of 'team_details_bloc.dart';

@freezed
abstract class TeamDetailsState with _$TeamDetailsState {
  const factory TeamDetailsState({
    @required SearchTerm teamSearch,
    @required Option<Either<TeamFailure, Team>> teamFailureOrSuccess,
    @required bool isSearching,
  }) = _TeamDetailsState;
  factory TeamDetailsState.initial() => TeamDetailsState(
        teamSearch: SearchTerm(''),
        teamFailureOrSuccess: none(),
        isSearching: false,
      );
}
