part of 'team_details_bloc.dart';

@freezed
abstract class TeamDetailsEvent with _$TeamDetailsEvent {
  const factory TeamDetailsEvent.changeTeam(String teamSearch) = _ChangeTeam;
  const factory TeamDetailsEvent.search(String teamSearch) = _Search;
}
