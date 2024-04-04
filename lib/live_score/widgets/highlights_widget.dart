import 'package:flutter/material.dart';

class HighlightsWidget extends StatefulWidget {
  const HighlightsWidget({super.key});

  @override
  State<HighlightsWidget> createState() => _HighlightsWidgetState();
}

class _HighlightsWidgetState extends State<HighlightsWidget> {
  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
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
          const Row(
            children: [
              //insert homeTeam highlights
              Column(),
              //insert awayTeam highlights
              Column(),
            ],
          ),
        ],
      ),
    );
  }
}
