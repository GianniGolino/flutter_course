import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/highlight.dart';
import 'package:flutter_animations/live_score/models/player.dart';
import 'package:flutter_animations/live_score/models/team/team_factory.dart';
import 'package:flutter_animations/live_score/widgets/highlights_widget.dart';
import 'package:flutter_animations/live_score/widgets/players_list_widget.dart';
import 'package:flutter_animations/live_score/widgets/score_bar_widget.dart';
import 'package:flutter_animations/live_score/widgets/teams_and_time_bar_widget.dart';
import 'package:gap/gap.dart';

class LiveScorePage extends StatefulWidget {
  const LiveScorePage({super.key});

  @override
  State<LiveScorePage> createState() => _LiveScorePageState();
}

class _LiveScorePageState extends State<LiveScorePage> {
  final homeTeam = buildHomeTeam();
  final awayTeam = buildAwayTeam();

  int _homeTeamScore = 0;
  int _awayTeamScore = 0;

  static const double _horizontalPadding = 24;
  static const double _verticalPadding = 20;

  final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);

  bool isAHomePlayer = true;
  final List<Highlight> _highlightsList = [];
  final List<String> _highlightTimes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        foregroundColor: _secondaryColor,
        title: const Text(
          'Live Score',
        ),
      ),
      body: Container(
        color: _primaryColor,
        padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding, vertical: _verticalPadding),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: _secondaryColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    TeamsAndTimeBarWidget(
                      onHighlightTime: (p0) {
                        _highlightTimes.add(p0);
                      },
                      onMatchStart: onMatchStart,
                      homeTeam: homeTeam,
                      awayTeam: awayTeam,
                      onEvent: (highlight) {
                        setState(() {
                          _highlightsList.add(highlight);
                          updateScore(highlight.player);
                        });
                      },
                    ),
                    const Gap(4),
                    ScoreBarWidget(
                      homeTeamScore: _homeTeamScore,
                      awayTeamScore: _awayTeamScore,
                    ),
                  ],
                ),
              ),
              const Gap(8),
              HighlightsWidget(
                highlightTimes: _highlightTimes,
                highlightList: _highlightsList,
              ),
              const Gap(32),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PlayersListWidget(
                        onStatusChanged: (player) => updateColor(player),
                        homeTeam: homeTeam,
                        awayTeam: awayTeam,
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateScore(Player player) {
    if (player.hasScored) {
      if (player.isAHomeTeamPlayer) {
        _homeTeamScore++;
      } else {
        _awayTeamScore++;
      }
      player.hasScored = false;
    } else if (player.ownGoal) {
      if (player.isAHomeTeamPlayer) {
        _awayTeamScore++;
      } else {
        _homeTeamScore++;
      }
      player.ownGoal = false;
    }
  }

  void onMatchStart() {
    setState(() {
      _homeTeamScore = 0;
      _awayTeamScore = 0;
      _highlightsList.clear();
      _highlightTimes.clear();
      for (Player player in homeTeam.players) {
        player.isCautioned = false;
        player.isExpelled = false;
        player.hasScored = false;
        player.ownGoal = false;
        player.numberOfGoals = 0;
        player.numberofOwnGoals = 0;
      }
      for (Player player in awayTeam.players) {
        player.isCautioned = false;
        player.isExpelled = false;
        player.numberOfGoals = 0;
        player.numberofOwnGoals = 0;
        player.hasScored = false;
        player.ownGoal = false;
      }
    });
  }

  Color updateColor(Player player) {
    if (player.isExpelled) {
      return Colors.red;
    } else if (player.isCautioned) {
      return Colors.yellow;
    } else {
      return Colors.transparent;
    }
  }
}
