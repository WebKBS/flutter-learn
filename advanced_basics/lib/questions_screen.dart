import 'package:advanced_basics/answer_button.dart';
import 'package:advanced_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(questions[currentQuestionIndex].text);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 201, 233, 252)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTab: () {
                      answerQuestion(answer);
                    });
              }),

              // AnswerButton(answerText: currentQuestion.answers[0], onTab: () {}),
              // AnswerButton(answerText: "Answer 2", onTab: () {}),
              // AnswerButton(answerText: "Answer 3", onTab: () {}),
              // AnswerButton(answerText: "Answer 4", onTab: () {}),
            ],
          )),
    );
  }
}
