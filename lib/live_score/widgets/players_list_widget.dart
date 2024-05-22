import 'package:flutter/material.dart';
import 'package:flutter_animations/live_score/models/player.dart';
import 'package:flutter_animations/live_score/models/team/team.dart';
import 'package:gap/gap.dart';

class PlayersListWidget extends StatefulWidget {
  const PlayersListWidget({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.onStatusChanged,
  });

  final Team homeTeam;
  final Team awayTeam;

  final Color Function(Player) onStatusChanged;

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        //shirtNumber
                        SizedBox(
                          width: 25,
                          child: Text(
                            widget.homeTeam.players[index].shirtNumber
                                .toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: widget.homeTeam.players[index].isPlaying
                                    ? _secondaryColor
                                    : _secondaryColor.withOpacity(0.6)),
                          ),
                        ),
                        const Gap(8),
                        //playername
                        Text(
                          textAlign: TextAlign.left,
                          widget.homeTeam.players[index].playerName,
                          style: TextStyle(
                              fontSize: 18,
                              color: widget.homeTeam.players[index].isPlaying
                                  ? _secondaryColor
                                  : _secondaryColor.withOpacity(0.6)),
                        ),
                        const Gap(8),
                        //card container
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: widget.onStatusChanged(
                                widget.homeTeam.players[index]),
                          ),
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                    //Goal icons
                    Row(
                      children: [
                        const SizedBox(
                          width: 0,
                          height: 24,
                        ),
                        for (int i = 0;
                            i < widget.homeTeam.players[index].numberOfGoals;
                            i++)
                          const Icon(Icons.sports_soccer, color: Colors.green),
                        for (int i = 0;
                            i < widget.homeTeam.players[index].numberofOwnGoals;
                            i++)
                          const Icon(
                            Icons.sports_soccer,
                            color: Colors.red,
                          )
                      ],
                    ),
                  ],
                ),
              ),
              //const Gap(32),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //card container
                      Container(
                        decoration: BoxDecoration(
                          color: widget
                              .onStatusChanged(widget.awayTeam.players[index]),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        width: 15,
                        height: 15,
                      ),
                      const Gap(8),
                      //playerName
                      Text(
                        widget.awayTeam.players[index].playerName,
                        style: TextStyle(
                            fontSize: 18,
                            color: widget.awayTeam.players[index].isPlaying
                                ? _secondaryColor
                                : _secondaryColor.withOpacity(0.6)),
                        //textAlign: TextAlign.end,
                      ),
                      const Gap(8),
                      //shirtNumber
                      SizedBox(
                        width: 25,
                        child: Text(
                          textAlign: TextAlign.end,
                          widget.awayTeam.players[index].shirtNumber.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: widget.awayTeam.players[index].isPlaying
                                  ? _secondaryColor
                                  : _secondaryColor.withOpacity(0.6)),
                          //textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  //Goal icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 24,
                        width: 0,
                      ),
                      for (int i = 0;
                          i < widget.awayTeam.players[index].numberOfGoals;
                          i++)
                        const Icon(Icons.sports_soccer, color: Colors.green),
                      for (int i = 0;
                          i < widget.awayTeam.players[index].numberofOwnGoals;
                          i++)
                        const Icon(
                          Icons.sports_soccer,
                          color: Colors.red,
                        )
                    ],
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
