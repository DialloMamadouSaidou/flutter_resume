import "package:flutter/material.dart";
import "package:full_cours/challenge/first_screen.dart";
import "package:full_cours/challenge/QuestionScreen.dart";
import "package:full_cours/challenge/data/questions.dart";
import "package:full_cours/challenge/AnswerSummary.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var active_screen = "active-screen";
  final List<String> liste_reponse = [];

  void changeScreen() {
    setState(() {
      active_screen = "question-screen";
    });
  }

  void verify_fin_question() {
    setState(() {
      if (liste_reponse.length == questions.length) {
        active_screen = "answer-summary";
      }
    });
  }

  @override
  Widget build(context) {
    Widget? affichage = switch (active_screen) {
      "active_screen" => FirstScreen(changeScreen),
      "question-screen" => Questionscreen(
        liste_reponse: liste_reponse,
        verify_fin_question: verify_fin_question,
      ),
      "answer-summary" => Answersummary(liste_reponse, changeScreen),
      _ => FirstScreen(changeScreen),
    };
    return Scaffold(backgroundColor: Colors.deepPurple, body: affichage);
  }
}
