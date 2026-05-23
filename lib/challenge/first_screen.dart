import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget {
  final void Function() changeScreen;
  const FirstScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Colors.white54,
          ),
          SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: changeScreen,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            label: Text("Start Quiz"),
            icon: Icon(Icons.arrow_right_alt, size: 30),
          ),
        ],
      ),
    );
  }
}
