import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/highlight.dart';
import 'package:flutter_animations/live_score/models/player.dart';
import 'package:flutter_animations/live_score/models/random_event.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:gap/gap.dart';
import 'dart:async';

class TeamsAndTimeBarWidget extends StatefulWidget {
  const TeamsAndTimeBarWidget({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.onEvent,
    required this.onHighlightTime,
    required this.onMatchStart,
  });

  final Team homeTeam;
  final Team awayTeam;

  final void Function(Highlight) onEvent;
  final void Function(String) onHighlightTime;
  final void Function() onMatchStart;

  @override
  State<TeamsAndTimeBarWidget> createState() => _TeamsAndTimeBarWidgetState();
}

class _TeamsAndTimeBarWidgetState extends State<TeamsAndTimeBarWidget> {
  Timer? _timer;
  final Duration _duration = const Duration(seconds: 1);
  String _matchTimer = "0";
  final List<int> timeInterval = [];

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
          splashColor: Colors.amberAccent,
          onPressed: () {
            if (_timer == null) {
              widget.onMatchStart();
              generateHighlightMoments();
              startTimer();
            }
          },
          icon: Icon(Icons.play_arrow, color: _secondaryColor),
        ),
      ],
    );
    // ),
  }

  void startTimer() {
    _timer ??= Timer.periodic(_duration, (internalTimer) {
      handleMatchTimer(internalTimer);
    });
  }

  void handleMatchTimer(Timer timer) {
    if (timer.tick < 91) {
      setState(() {
        _matchTimer = timer.tick.toString();
      });
      if (timeInterval.contains(timer.tick)) {
        randomEvent();
        widget.onHighlightTime(_matchTimer);
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

    fullPlayerList.shuffle();
    Player selectedPlayer = fullPlayerList.first;
    RandomEvent event = RandomEvent.values[Random().nextInt(4)];
    widget.onEvent(randomGenerator(selectedPlayer, event));
  }

  Highlight randomGenerator(Player player, RandomEvent event) {
    switch (event) {
      case RandomEvent.goal:
        player.hasScored = true;
        player.numberOfGoals++;
        return Highlight(player, '${player.playerName} has scored a goal');

      case RandomEvent.ownGoal:
        player.ownGoal = true;
        player.numberofOwnGoals++;
        return Highlight(player, '${player.playerName} has scored an own goal');

      case RandomEvent.redCard:
        player.isExpelled = true;
        return Highlight(player, '${player.playerName} has been expelled');

      case RandomEvent.yellowCard:
        player.isCautioned = true;
        return Highlight(player, '${player.playerName} has been cautioned');
    }
  }

  List<int> generateHighlightMoments() {
    timeInterval.clear();
    // Set the maximum number of 'highlight moments'
    int numOfElements = Random().nextInt(16);

    while (timeInterval.length < numOfElements) {
      int randomNumber = Random().nextInt(91);
      if (!timeInterval.contains(randomNumber)) {
        // Check if the number is not already in the list
        timeInterval.add(randomNumber);
      }
    }
    timeInterval.sort();
    return timeInterval;
  }
}
