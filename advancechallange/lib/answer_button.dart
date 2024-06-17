import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String answer;

  const AnswerButton({required this.onTap, required this.answer, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white),
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
