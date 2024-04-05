import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:gap/gap.dart';

class PlayersListWidget extends StatefulWidget {
  const PlayersListWidget(
      {super.key, required this.homeTeam, required this.awayTeam});

  final Team homeTeam;
  final Team awayTeam;

  @override
  State<PlayersListWidget> createState() => _PlayersListWidgetState();
}

class _PlayersListWidgetState extends State<PlayersListWidget> {
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                      child: Text(
                        widget.homeTeam.players[index].shirtNumber.toString(),
                        style: TextStyle(fontSize: 18, color: _secondaryColor),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      textAlign: TextAlign.left,
                      widget.homeTeam.players[index].playerName,
                      style: TextStyle(fontSize: 18, color: _secondaryColor),
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.awayTeam.players[index].playerName,
                    style: TextStyle(fontSize: 18, color: _secondaryColor),
                    //textAlign: TextAlign.end,
                  ),
                  const Gap(8),
                  SizedBox(
                    width: 25,
                    child: Text(
                      textAlign: TextAlign.end,
                      widget.awayTeam.players[index].shirtNumber.toString(),
                      style: TextStyle(fontSize: 18, color: _secondaryColor),
                      //textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ))
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: widget.homeTeam.players.length);
  }
}
