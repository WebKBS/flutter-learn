import 'package:advanced_basics/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "The question...",
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(answerText: "Answer 1", onTab: () {}),
          AnswerButton(answerText: "Answer 2", onTab: () {}),
          AnswerButton(answerText: "Answer 3", onTab: () {}),
          AnswerButton(answerText: "Answer 4", onTab: () {}),
        ],
      ),
    );
  }
}
