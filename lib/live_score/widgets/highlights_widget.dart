import 'package:flutter/material.dart';

class HighlightsWidget extends StatefulWidget {
  const HighlightsWidget(
      {super.key, required this.highlight, required this.isAHomePlayer});

  final String highlight;
  final bool isAHomePlayer;

  @override
  State<HighlightsWidget> createState() => _HighlightsWidgetState();
}

class _HighlightsWidgetState extends State<HighlightsWidget> {
  //final Color _primaryColor = const Color.fromARGB(255, 8, 76, 93);
  final Color _secondaryColor = const Color.fromARGB(255, 254, 178, 36);
  @override
  Widget build(BuildContext context) {
    print('${widget.highlight}, ${widget.isAHomePlayer}');
    return Container(
      padding: const EdgeInsets.all(8),
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
          Row(
            mainAxisAlignment: widget.isAHomePlayer
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Text(
                widget.highlight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
