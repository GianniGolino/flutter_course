import 'package:flutter/material.dart';
import 'package:flutter_animations/state_management/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderSecondPage extends StatelessWidget {
  const ProviderSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider second page'),
      ),
      body: Center(
        child: Text('${context.watch<CounterProvider>().count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().remove();
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
