import 'package:advanced_basics/answer_button.dart';
import 'package:advanced_basics/data/questions.dart';
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
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map((item) {
            return AnswerButton(answerText: item, onTab: () {});
          }),

          // AnswerButton(answerText: currentQuestion.answers[0], onTab: () {}),
          // AnswerButton(answerText: "Answer 2", onTab: () {}),
          // AnswerButton(answerText: "Answer 3", onTab: () {}),
          // AnswerButton(answerText: "Answer 4", onTab: () {}),
        ],
      ),
    );
  }
}
