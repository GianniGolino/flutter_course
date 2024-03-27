import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LiveScoreBoardWidget extends StatefulWidget {
  const LiveScoreBoardWidget({super.key});

  @override
  State<LiveScoreBoardWidget> createState() => _LiveScoreBoardWidgetState();
}

class _LiveScoreBoardWidgetState extends State<LiveScoreBoardWidget> {
  int homeTeamScore = 0;
  int awayTeamScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/512px-FC_Internazionale_Milano_2021.svg.png'),
            ),
            const Gap(16),
            const Text('Inter', style: TextStyle(fontSize: 24)),
          ],
        ),
        const Gap(32),
        Text(
          '$homeTeamScore',
          style: const TextStyle(fontSize: 24),
        ),
        const Gap(16),
        const Text(
          '-',
          style: TextStyle(fontSize: 24),
        ),
        const Gap(16),
        Text(
          '$awayTeamScore',
          style: const TextStyle(fontSize: 24),
        ),
        const Gap(32),
        Column(
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset('assets/images/n_logo.png'),
            ),
            const Gap(16),
            const Text('Napoli', style: TextStyle(fontSize: 24)),
          ],
        ),
      ],
    );
  }
}
