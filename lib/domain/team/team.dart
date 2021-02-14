import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';

@freezed
abstract class Team with _$Team {
  const Team._();

  factory Team({
    @required int id,
    @required String name,
    @required String country,
    @required int founded,
    @required String logo,
  }) = _Team;

  factory Team.empty() => Team(
        id: 0,
        name: '',
        country: '',
        founded: 0,
        logo: '',
      );
}
