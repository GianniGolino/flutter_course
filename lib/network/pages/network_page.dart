import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: requestString(),
          builder: (context, data) {
            return data.hasData
                ? Center(
                    child: Text(data.data ?? ''),
                  )
                : const SizedBox.shrink();
          }),
    );
  }

  Future<String> requestString() {
    return Future.delayed(const Duration(seconds: 3)).then((value) {
      return 'Gianni';
    });
  }
}
