import 'package:untitled1/models/models.dart';

class LeagueInfo {
  final String leagueName;
  final String country;
  final List<ClubInfoMatch> matches;

  LeagueInfo(
      {required this.leagueName, required this.country, required this.matches});
}
