import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:gap/gap.dart';

class PlayersListWidget extends StatefulWidget {
  const PlayersListWidget({super.key});

  @override
  State<PlayersListWidget> createState() => _PlayersListWidgetState();
}

class _PlayersListWidgetState extends State<PlayersListWidget> {
  List<String> homeTeamPlayers = [
    'Sommer',
    'Di Marco',
    'Bastoni',
    'Acerbi',
    'Pavard',
    'Mkhitaryan',
    'Barella',
    'Chalanoglu',
    'Darmian',
    'Thuram',
    'Lautaro'
  ];

  List<String> awayTeamPlayers = [
    'Meret',
    'Rrahmani',
    'J. Jesus',
    'M. Rui',
    'Di Lorenzo',
    'Lobotka',
    'Anguissa',
    'Zielinski',
    'Kvaratskhelia',
    'Politano',
    'Osimenh',
  ];

  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        //physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                //textAlign: TextAlign.left,
                homeTeamPlayers[index],
                style: TextStyle(fontSize: 18, color: _secondaryColor),
              ),
              const Gap(32),
              Text(
                awayTeamPlayers[index],
                style: TextStyle(fontSize: 18, color: _secondaryColor),
                //textAlign: TextAlign.end,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: homeTeamPlayers.length);
  }
}
