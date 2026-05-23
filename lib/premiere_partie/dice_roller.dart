import "package:flutter/material.dart";
import "dart:math";

class DiceRoller extends StatefulWidget {
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var current_dice = 1;

  void rollDice() {
    var actuel_number = current_dice;
    setState(() {
      current_dice = Random().nextInt(4) + 1;
      while (actuel_number == current_dice) {
        current_dice = Random().nextInt(4) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-$current_dice.png", width: 200),
        SizedBox(height: 15),
        TextButton(
          onPressed: rollDice,
          child: const Text("Roll Dice"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
