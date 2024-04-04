import 'package:flutter/material.dart';

class ScoreBarWidget extends StatefulWidget {
  const ScoreBarWidget(
      {super.key, required this.homeTeamScore, required this.awayTeamScore});

  final int homeTeamScore;
  final int awayTeamScore;

  @override
  State<ScoreBarWidget> createState() => _ScoreBarWidgetState();
}

class _ScoreBarWidgetState extends State<ScoreBarWidget> {
  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${widget.homeTeamScore} - ${widget.awayTeamScore}',
          style: TextStyle(fontSize: 35, color: _secondaryColor),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.pause),
        // ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.stop),
        // ),
      ],
    );
  }
}
