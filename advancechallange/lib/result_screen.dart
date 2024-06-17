import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, Object>> results; // Add this line
  final VoidCallback onRestart; // Add this line

  const ResultScreen({
    super.key,
    required this.results,
    required this.onRestart, // Modify the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered ${results.where((result) => result['isCorrect'] as bool).length} out of ${results.length} questions correctly',
                style:
                    GoogleFonts.lato(fontSize: 24, color: Colors.orangeAccent),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          result['question'] as String,
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.orangeAccent),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your answer: ${result['userAnswer']}',
                              style: TextStyle(
                                  color: result['isCorrect'] as bool
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            Text('Correct answer: ${result['correctAnswer']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: onRestart, // Modify this line
                child: const Text('Restart Quiz!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
