import "package:flutter/material.dart";
import "package:full_cours/challenge/AfficheReponse.dart";
import "package:full_cours/challenge/data/questions.dart";
import "package:google_fonts/google_fonts.dart";
import "package:full_cours/challenge/quiz.dart";

class Answersummary extends StatefulWidget {
  final List<String> all_reponse;
  final void Function() return_to_data;
  const Answersummary(this.all_reponse, this.return_to_data, {super.key});

  @override
  State<Answersummary> createState() => _AnswerSummaryState();
}

class _AnswerSummaryState extends State<Answersummary> {
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> data_reponse = [];
    for (int i = 0; i < widget.all_reponse.length; i++) {
      data_reponse.add({
        "question_index": i + 1,
        "question_reponse": widget.all_reponse[i],
        "question_pose": questions[i].text,
        "true_reponse": questions[i].answers[0],
      });
    }
    return data_reponse;
  }

  void Restart() {
    setState(() {
      widget.all_reponse.clear();
    });
    widget.return_to_data();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vous avez X bon resultats sur Y",
            style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 15),
          AfficheReponse(getSummaryData()),
          SizedBox(height: 15),
          TextButton(
            onPressed: Restart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: Text("Restart-Quiz"),
          ),
        ],
      ),
    );
  }
}
