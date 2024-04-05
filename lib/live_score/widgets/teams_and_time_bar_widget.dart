import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/player.dart';
import 'package:flutter_animations/live_score/models/random_event.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:gap/gap.dart';
import 'dart:async';

class TeamsAndTimeBarWidget extends StatefulWidget {
  const TeamsAndTimeBarWidget(
      {super.key,
      required this.homeTeam,
      required this.awayTeam,
      required this.onEvent});

  final Team homeTeam;
  final Team awayTeam;

  final void Function(String, bool) onEvent;

  @override
  State<TeamsAndTimeBarWidget> createState() => _TeamsAndTimeBarWidgetState();
}

class _TeamsAndTimeBarWidgetState extends State<TeamsAndTimeBarWidget> {
  Timer? _timer;
  Duration duration = const Duration(seconds: 1);
  String _matchTimer = "0";
  final List<int> timeInterval = [
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    15,
    16,
    20,
    22,
    25,
    26,
    30,
    40
  ];

  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: Image.network(widget.homeTeam.iconPath),
        ),
        const Gap(8),
        Text(
          widget.homeTeam.name,
          style: TextStyle(
            fontSize: 22,
            color: _secondaryColor,
          ),
        ),
        const Gap(8),
        Text(
          '-',
          style: TextStyle(fontSize: 22, color: _secondaryColor),
        ),
        const Gap(8),
        Text(
          widget.awayTeam.name,
          style: TextStyle(fontSize: 22, color: _secondaryColor),
        ),
        const Gap(8),
        SizedBox(
          height: 30,
          child: Image.asset(widget.awayTeam.iconPath),
        ),
        const Gap(16),
        Text(
          "$_matchTimer'",
          //textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: _secondaryColor),
        ),
        IconButton(
          onPressed: () {
            startTimer();
          },
          icon: Icon(Icons.play_arrow, color: _secondaryColor),
        ),
      ],
    );
    // ),
  }

  void startTimer() {
    _timer ??= Timer.periodic(duration, (internalTimer) {
      handleMatchTimer(internalTimer);
    });
  }

  void handleMatchTimer(Timer timer) {
    if (timer.tick < 45) {
      setState(() {
        _matchTimer = timer.tick.toString();
      });

      if (timeInterval.contains(timer.tick)) {
        randomEvent();
      }
    } else {
      setState(() {
        _timer?.cancel();
        _timer = null;
        _matchTimer = '-';
      });
    }
  }

  void randomEvent() {
    final List<Player> fullPlayerList =
        widget.homeTeam.players + widget.awayTeam.players;

    // fullPlayerList[Random().nextInt(fullPlayerList.length)];
    fullPlayerList.shuffle();
    RandomEvent event = RandomEvent.values[Random().nextInt(4)];
    widget.onEvent(randomGenerator(fullPlayerList.first, event),
        fullPlayerList.first.isAHomeTeamPlayer);
    print(
        '${fullPlayerList.first.playerName}, $event, ${fullPlayerList.first.isAHomeTeamPlayer}');
  }

  String randomGenerator(Player player, RandomEvent event) {
    switch (event) {
      case RandomEvent.goal:
        return '${player.playerName} has scored a goal';

      case RandomEvent.ownGoal:
        return '${player.playerName} has scored an own goal';

      case RandomEvent.redCard:
        return '${player.playerName} has been expelled';

      case RandomEvent.yellowCard:
        return '${player.playerName} has been cautioned';

      default:
        return '';
    }
  }
}
