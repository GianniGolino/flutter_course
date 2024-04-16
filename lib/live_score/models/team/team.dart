import 'package:flutter_animations/live_score/models/player.dart';

class Team {
  String name;
  List<Player> players;
  String iconPath;
  int score = 0;

  Team({required this.name, required this.players, required this.iconPath});
}
