import 'package:flutter/material.dart';
import 'package:flutter_animations/animation.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text('Animations'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(bottomToTopSlide());
                  },
                  child: const Text('Bottom to top slide'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(topToBottomSlide());
                  },
                  child: const Text('Top to bottom slide'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(leftToRightSlide());
                  },
                  child: const Text('Left to right slide'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(rightToLeftSlide());
                  },
                  child: const Text('Right to left slide'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(fadeTransition());
                  },
                  child: const Text('Fade transition'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(scaleTransition());
                  },
                  child: const Text('Scale transition'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      toChapter8(),
                    );
                  },
                  child: const Text('Capitolo 8'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
