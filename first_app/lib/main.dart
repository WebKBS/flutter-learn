import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 197, 163, 255),
                Color.fromARGB(255, 255, 163, 197),
              ],
            ),
          ),
          child: const Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    ),
  );
}
