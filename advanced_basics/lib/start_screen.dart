import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
        ),
        const SizedBox(height: 20),
        const Text('Welcome to the Quiz!',
            style: TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
        const SizedBox(height: 30),
        OutlinedButton(onPressed: () {}, child: const Text('Start Quiz'))
      ],
    ));
  }
}
