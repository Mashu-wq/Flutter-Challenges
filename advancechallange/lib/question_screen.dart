import 'package:flutter/material.dart';
import 'package:advancechallange/answer_button.dart';
import 'package:advancechallange/data/question_data.dart';
import 'package:advancechallange/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  List<Map<String, Object>> results = [];

  void answerQuestion(String userAnswer) {
    final isCorrect =
        questions[currentQuestionIndex].correctAnswer == userAnswer;
    results.add({
      'question': questions[currentQuestionIndex].text,
      'correctAnswer': questions[currentQuestionIndex].correctAnswer,
      'userAnswer': userAnswer,
      'isCorrect': isCorrect,
    });

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              results: results,
              onRestart: restartQuiz, // Pass the callback here
            ),
          ),
        );
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      results = [];
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 24, color: Colors.orange),
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswers().map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AnswerButton(
                      onTap: () => answerQuestion(answer),
                      answer: answer,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
