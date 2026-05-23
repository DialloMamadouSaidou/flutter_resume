import "package:flutter/material.dart";
import "package:full_cours/premiere_partie/dice_roller.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Center(child: DiceRoller());
  }
}

class AddDecoratoin extends StatelessWidget {
  final List<Color> my_liste_color;

  const AddDecoratoin({super.key, required this.my_liste_color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 3),
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [...my_liste_color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CustomText("Diallo"),
    );
  }
}

class CustomText extends StatelessWidget {
  final String my_text;
  const CustomText(this.my_text, {super.key});
  @override
  Widget build(context) {
    return Text(
      my_text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        wordSpacing: 3,
      ),
    );
  }
}
