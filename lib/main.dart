import 'package:flutter/material.dart';
import 'package:flutter_animations/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_animations/state_management/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
