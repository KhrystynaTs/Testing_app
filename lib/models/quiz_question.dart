class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(
        answers); //we first create a copy and store this copy in a variable shuffledList
    shuffledList.shuffle();
    return shuffledList;
  }
}
