import 'package:flutter/material.dart';
import 'package:flutter_animations/state_management/pages/provider_second_page.dart';
import 'package:flutter_animations/state_management/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderFirstPage extends StatelessWidget {
  const ProviderFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider first page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const ProviderSecondPage()));
                },
                icon: const Icon(Icons.arrow_forward_ios)),
          )
        ],
      ),
      body: Center(
        child: Text('${context.watch<CounterProvider>().count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
