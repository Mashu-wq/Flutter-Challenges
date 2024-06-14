import 'package:flutter/material.dart';
import 'package:rollardice/gradient_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: GradientBackground(Colors.purpleAccent, Colors.deepPurple)),
    );
  }
}
