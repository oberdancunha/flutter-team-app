part of 'team_form_search_bloc.dart';

@freezed
abstract class TeamFormSearchState with _$TeamFormSearchState {
  const factory TeamFormSearchState({
    @required Option<Either<Failure, Team>> teamFailureOrSuccess,
    @required bool isSearching,
    @required bool activateSearchText,
    @required bool teamSearchingIsEmpty,
  }) = _TeamFormSearchState;
  factory TeamFormSearchState.initial() => TeamFormSearchState(
        teamFailureOrSuccess: none(),
        isSearching: false,
        activateSearchText: true,
        teamSearchingIsEmpty: true,
      );
}
