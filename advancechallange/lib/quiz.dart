import 'package:advancechallange/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/questions-logo.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        Text('Learn Flutter the fun way',
            style: GoogleFonts.lato(fontSize: 24, color: Colors.white)),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuestionScreen(),
              ),
            );
          },
          style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right, color: Colors.orangeAccent),
          label: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.orangeAccent, fontSize: 22),
          ),
        ),
      ],
    );
  }
}
