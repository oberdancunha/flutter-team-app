part of 'team_form_search_bloc.dart';

@freezed
abstract class TeamFormSearchEvent with _$TeamFormSearchEvent {
  const factory TeamFormSearchEvent.changeTeam(String teamSearch) = _ChangeTeam;
  const factory TeamFormSearchEvent.search(String teamSearch) = _Search;
}
