import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/button_column_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text('Animations'),
        ),
        body: const ButtonColumnWidget(),
    );
  }
}
