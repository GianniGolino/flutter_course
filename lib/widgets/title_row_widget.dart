import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: AutoSizeText(
              maxLines: 2,
              'To do',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
