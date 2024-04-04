import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:flutter_animations/live_score/models/player.dart';

Team buildHomeTeam() {
  return Team(
      name: 'Inter',
      players: [
        Player(
            shirtNumber: 1,
            playerName: 'Sommer',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
        Player(
            shirtNumber: 95,
            playerName: 'Bastoni',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
        Player(
            shirtNumber: 32,
            playerName: 'Di Marco',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
        Player(
            shirtNumber: 23,
            playerName: 'Barella',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
        Player(
            shirtNumber: 9,
            playerName: 'Thuram',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
        Player(
            shirtNumber: 10,
            playerName: 'Lautaro',
            isAHomeTeamPlayer: true,
            isCautioned: false,
            isExpelled: false,
            hasScored: false,
            numberOfGoals: 0),
      ],
      iconPath:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/512px-FC_Internazionale_Milano_2021.svg.png');
}

Team buildAwayTeam() {
  return Team(name: 'Napoli', players: [], iconPath: '');
}
