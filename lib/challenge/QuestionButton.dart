import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Questionbutton extends StatelessWidget {
  final String text;
  final void Function(String item) change_question;

  const Questionbutton({
    super.key,
    required this.text,
    required this.change_question,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextButton(
        onPressed: () {
          change_question(text);
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
