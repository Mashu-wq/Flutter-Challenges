class QuizQuestion {
  final String text;
  final List<String> answers;
  final String correctAnswer;

  QuizQuestion(this.text, this.answers, this.correctAnswer);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
