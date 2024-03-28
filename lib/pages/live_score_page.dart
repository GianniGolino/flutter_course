import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/live_score_board_widget.dart';
import 'package:flutter_animations/widgets/update_score_widget.dart';
import 'package:gap/gap.dart';

class LiveScorePage extends StatefulWidget {
  const LiveScorePage({super.key});

  @override
  State<LiveScorePage> createState() => _LiveScorePageState();
}

class _LiveScorePageState extends State<LiveScorePage> {
  int homeTeamScore = 0;
  int awayTeamScore = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          //backgroundColor: Colors.greenAccent,
          title: const Text('Live Score'),
        ),
        body: Center(
          child: Column(
            children: [
              const Gap(32),
              LiveScoreBoardWidget(
                homeTeamScore: homeTeamScore,
                awayTeamScore: awayTeamScore,
              ),
              const Spacer(),
              UpdateScoreWidget(
                onHomeTeamScoreChanged: (p0) {
                  setState(() {
                    homeTeamScore += p0;
                  });
                },
                onAwayTeamScoreChanged: (p0) {
                  setState(() {
                    awayTeamScore += p0;
                  });
                },
              ),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
