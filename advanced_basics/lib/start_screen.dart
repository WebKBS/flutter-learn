import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(255, 115, 255, 171),
            ),
          ),
          const SizedBox(height: 80),
          const Text('Welcome to the Quiz!',
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255)))),
        ],
      ),
    );
  }
}
