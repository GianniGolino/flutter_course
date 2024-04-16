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
            events: []),
        Player(
            shirtNumber: 28,
            playerName: 'Pavard',
            isAHomeTeamPlayer: true,
            events: []),
        Player(
            shirtNumber: 15,
            playerName: 'Acerbi',
            isAHomeTeamPlayer: true,
            events: []),
        // Player(
        //     shirtNumber: 95,
        //     playerName: 'Bastoni',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 32,
        //     playerName: 'Di Marco',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 22,
        //     playerName: 'Mkhitaryan',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 20,
        //     playerName: 'Calhanoglu',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 23,
        //     playerName: 'Barella',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 36,
        //     playerName: 'Darmian',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 9,
        //     playerName: 'Thuram',
        //     isAHomeTeamPlayer: true,
        //     events: []),
        // Player(
        //     shirtNumber: 10,
        //     playerName: 'Lautaro',
        //     isAHomeTeamPlayer: true,
        //     events: []),
      ],
      iconPath:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/512px-FC_Internazionale_Milano_2021.svg.png');
}

Team buildAwayTeam() {
  return Team(
      name: 'Napoli',
      players: [
        // Player(
        //     shirtNumber: 1,
        //     playerName: 'Meret',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 22,
        //     playerName: 'Di Lorenzo',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 13,
        //     playerName: 'Rrahmani',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 5,
        //     playerName: 'Jesus',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 6,
        //     playerName: 'M. Rui',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 99,
        //     playerName: 'Anguissa',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 68,
        //     playerName: 'Lobotka',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        // Player(
        //     shirtNumber: 8,
        //     playerName: 'Traorè',
        //     isAHomeTeamPlayer: false,
        //     events: []),
        Player(
            shirtNumber: 21,
            playerName: 'Politano',
            isAHomeTeamPlayer: false,
            events: []),
        Player(
            shirtNumber: 9,
            playerName: 'Osimhen',
            isAHomeTeamPlayer: false,
            events: []),
        Player(
            shirtNumber: 81,
            playerName: 'Raspadori',
            isAHomeTeamPlayer: false,
            events: []),
      ],
      iconPath: 'assets/images/n_logo.png');
}
