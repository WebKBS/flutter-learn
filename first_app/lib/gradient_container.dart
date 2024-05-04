import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    startAlignment = Alignment.center;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: const [
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
