import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/player.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
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

  final int _homeTeamScore = 0;
  final int _awayTeamScore = 0;

  static const double _horizontalPadding = 24;
  static const double _verticalPadding = 20;

  final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);

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
                    const TeamsAndTimeBarWidget(),
                    const Gap(4),
                    ScoreBarWidget(
                      homeTeamScore: _homeTeamScore,
                      awayTeamScore: _awayTeamScore,
                    ),
                  ],
                ),
              ),
              const Gap(4),
              const HighlightsWidget(),
              const Gap(32),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PlayersListWidget(),
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
}
