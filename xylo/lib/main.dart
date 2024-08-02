import 'package:flutter/material.dart';

void main() => runApp(const Xylo());

class Xylo extends StatelessWidget {
  const Xylo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(),
        ),
      ),
    );
  }
}
