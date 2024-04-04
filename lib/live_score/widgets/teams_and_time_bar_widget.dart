import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:async';

class TeamsAndTimeBarWidget extends StatefulWidget {
  const TeamsAndTimeBarWidget({super.key});

  @override
  State<TeamsAndTimeBarWidget> createState() => _TeamsAndTimeBarWidgetState();
}

class _TeamsAndTimeBarWidgetState extends State<TeamsAndTimeBarWidget> {
  Timer? _timer;
  Duration duration = const Duration(seconds: 2);
  String _matchTimer = '0';

  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/512px-FC_Internazionale_Milano_2021.svg.png'),
        ),
        const Gap(8),
        Text(
          'Inter',
          style: TextStyle(
            fontSize: 24,
            color: _secondaryColor,
          ),
        ),
        const Gap(8),
        Text(
          '-',
          style: TextStyle(fontSize: 24, color: _secondaryColor),
        ),
        const Gap(8),
        Text(
          'Napoli',
          style: TextStyle(fontSize: 24, color: _secondaryColor),
        ),
        const Gap(8),
        SizedBox(
          height: 30,
          child: Image.asset('assets/images/n_logo.png'),
        ),
        const Gap(16),
        Text(
          _matchTimer,
          //textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: _secondaryColor),
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
    if (timer.tick < 11) {
      setState(() {
        _matchTimer = timer.tick.toString();
      });
    } else {
      setState(() {
        _timer?.cancel();
        _matchTimer = '-';
      });
    }
  }
}
