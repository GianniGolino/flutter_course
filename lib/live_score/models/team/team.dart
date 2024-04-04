import 'package:flutter_animations/live_score/models/player.dart';

class Team {
  String name;
  List<Player> players;
  String iconPath;

  Team({required this.name, required this.players, required this.iconPath});
}
