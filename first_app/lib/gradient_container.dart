import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: StyledText(),
      ),
    );
  }
}
