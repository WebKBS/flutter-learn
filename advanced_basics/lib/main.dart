import 'package:advanced_basics/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 54, 44, 23),
            Color.fromARGB(12, 32, 23, 12)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
