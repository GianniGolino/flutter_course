class Player {
  int shirtNumber;
  String playerName;
  bool isAHomeTeamPlayer;
  bool isCautioned;
  bool isExpelled;
  bool hasScored;
  bool ownGoal;
  int numberOfGoals;
  int numberofOwnGoals;
  List<String> events;

  Player({
    required this.shirtNumber,
    required this.playerName,
    required this.isAHomeTeamPlayer,
    this.isCautioned = false,
    this.isExpelled = false,
    this.hasScored = false,
    this.ownGoal = false,
    this.numberOfGoals = 0,
    this.numberofOwnGoals = 0,
    required this.events,
  });
}
