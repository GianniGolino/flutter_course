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
        body: const Center(
          child: Column(
            children: [
              Gap(32),
              LiveScoreBoardWidget(),
              Spacer(),
              UpdateScoreWidget(),
              Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
