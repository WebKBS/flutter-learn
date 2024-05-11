import 'package:advanced_basics/data/questions.dart';
import 'package:advanced_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("문제 풀이가 끝났습니다!",
                  style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 201, 233, 252)),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              Text("당신의 점수는 3점입니다.",
                  style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 201, 233, 252)),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              TextButton(onPressed: () {}, child: const Text("다시 시작")),
            ],
          )),
    );
  }
}
