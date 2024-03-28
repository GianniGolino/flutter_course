import 'package:flutter/material.dart';
import 'package:flutter_animations/model/animation.dart';
import 'package:flutter_animations/pages/animation_examples_page.dart';
import 'package:flutter_animations/pages/live_score_page.dart';
import 'package:gap/gap.dart';

class ButtonColumnWidget extends StatelessWidget {
  const ButtonColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AnimationExamplesPage()),
                );
              },
              child: const Text('Transition Animations'),
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  toChapter8(),
                );
              },
              child: const Text('Task Manager'),
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const LiveScorePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                        scale: animation.drive(
                          Tween(
                            begin: 0.0,
                            end: 1.0,
                          ),
                        ),
                        child: child);
                  },
                ));
              },
              child: const Text('Live Score'),
            ),
          ),
        ],
      ),
    );
  }
}
