import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // Expanded(
            //   child: Text(
            //     'ID',
            //   ),
            // ),
            // VerticalDivider(
            //   color: Colors.grey,
            //   thickness: 1,
            // ),
            Expanded(
              flex: 7,
              child: Text('Title'),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Text('Del'),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Text('Fav'),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Text('Mod'),
            ),
          ],
        ),
      ),
    );
  }
}
