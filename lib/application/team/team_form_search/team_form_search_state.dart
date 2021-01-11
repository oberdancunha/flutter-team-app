part of 'team_form_search_bloc.dart';

@freezed
abstract class TeamFormSearchState with _$TeamFormSearchState {
  const factory TeamFormSearchState({
    @required SearchText teamSearch,
    @required Option<Either<Failure, Team>> teamFailureOrSuccess,
    @required bool isSearching,
  }) = _TeamFormSearchState;
  factory TeamFormSearchState.initial() => TeamFormSearchState(
        teamSearch: SearchText(''),
        teamFailureOrSuccess: none(),
        isSearching: false,
      );
}
