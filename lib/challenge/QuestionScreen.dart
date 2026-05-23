import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:full_cours/challenge/data/questions.dart";
import "package:full_cours/challenge/QuestionButton.dart";

class Questionscreen extends StatefulWidget {
  final List<String> liste_reponse;
  final void Function() verify_fin_question;
  const Questionscreen({
    super.key,
    required this.liste_reponse,
    required this.verify_fin_question,
  });

  @override
  State<Questionscreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<Questionscreen> {
  int current_index = 0;
  int questionLength = questions.length;

  void changequestion(String item) {
    setState(() {
      widget.liste_reponse.add(item);
      if (widget.liste_reponse.length < questionLength - 1) {
        current_index++;
      } else {
        widget.verify_fin_question();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question_principal = questions[current_index];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(
            question_principal.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          ...question_principal.getShuffle().map((item) {
            return Questionbutton(text: item, change_question: changequestion);
          }),
        ],
      ),
    );
  }
}
