class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffle() {
    final temp_list = List.of(answers);
    temp_list.shuffle();
    return temp_list;
  }
}
