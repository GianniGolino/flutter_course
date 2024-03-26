import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text(
            'To do:',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
