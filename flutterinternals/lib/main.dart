import 'package:flutter/material.dart';
import 'package:flutterinternals/keys/keys.dart';
import 'package:flutterinternals/ui_updates_demo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Internals'),
          ),
          body: const Keys()),
    );
  }
}
