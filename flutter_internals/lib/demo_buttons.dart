import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget{
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() {
    return _DemoButtons();
  }
}

class _DemoButtons extends State<DemoButtons>{
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_isUnderstood)
              const Text(
                'Great! Keep up the good work!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

