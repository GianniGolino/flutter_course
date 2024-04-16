import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/live_score/models/highlight.dart';
import 'package:gap/gap.dart';

class HighlightsWidget extends StatefulWidget {
  const HighlightsWidget({super.key, required this.highlightList});

  final List<Highlight> highlightList;

  @override
  State<HighlightsWidget> createState() => _HighlightsWidgetState();
}

class _HighlightsWidgetState extends State<HighlightsWidget> {
  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  //final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 130,
      decoration: BoxDecoration(
          border: Border.all(color: _secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Highlights',
                style: TextStyle(
                  fontSize: 18,
                  color: _secondaryColor,
                ),
              ),
            ],
          ),
          const Gap(8),
          Expanded(
            child: ListView.builder(
              //controller: _controller,
              itemBuilder: (context, index) {
                return Text(
                  textAlign:
                      widget.highlightList[index].player.isAHomeTeamPlayer
                          ? TextAlign.start
                          : TextAlign.end,
                  widget.highlightList[index].eventDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: _secondaryColor,
                  ),
                );
              },
              itemCount: widget.highlightList.length,
            ),
          ),
        ],
      ),
    );
  }
}
