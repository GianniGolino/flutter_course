import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animations/animation/models/animation.dart';

class AnimationExamplesPage extends StatelessWidget {
  const AnimationExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Transition Animations'),
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
            const Gap(16),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(topToBottomSlide());
                },
                child: const Text('Top to bottom slide'),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(leftToRightSlide());
                },
                child: const Text('Left to right slide'),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(rightToLeftSlide());
                },
                child: const Text('Right to left slide'),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(fadeTransition());
                },
                child: const Text('Fade transition'),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(scaleTransition());
                },
                child: const Text('Scale transition'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
