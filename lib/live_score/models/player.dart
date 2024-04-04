class Player {
  int shirtNumber;
  String playerName;
  bool isAHomeTeamPlayer;
  bool isCautioned;
  bool isExpelled;
  bool hasScored;
  int numberOfGoals;

  Player(
      {required this.shirtNumber,
      required this.playerName,
      required this.isAHomeTeamPlayer,
      required this.isCautioned,
      required this.isExpelled,
      required this.hasScored,
      required this.numberOfGoals});
}
