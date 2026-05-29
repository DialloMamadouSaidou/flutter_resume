import "package:flutter/material.dart";

class ChatScreen extends StatelessWidget {

   @override
  Widget build(BuildContext context) {

     return Scaffold(
          appBar: AppBar(
            title: const Text("Fluuter Chat"),
          ),
          body: Center(
            child: const Text("Logged in"),
          )
     );
  }
}