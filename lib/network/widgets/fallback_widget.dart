import 'package:flutter/material.dart';
import 'package:flutter_animations/network/pages/posts_page.dart';
import 'package:gap/gap.dart';

class FallbackWidget extends StatefulWidget {
  const FallbackWidget({super.key});

  @override
  State<FallbackWidget> createState() => _FallbackWidgetState();
}

class _FallbackWidgetState extends State<FallbackWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error'),
          const Gap(16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const PostsPage()));
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
