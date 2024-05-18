import 'package:flutter/material.dart';
import 'package:flutter_internals/demo_buttons.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  @override
  StatefulElement createElement() {
    print('UIUpdatesDemo CREATEELEMENT called');
    return super.createElement();
  }

  @override
  State<UIUpdatesDemo> createState() {
    return _UIUpdatesDemo();
  }
}

class _UIUpdatesDemo extends State<UIUpdatesDemo> {

  @override
  Widget build(BuildContext context) {
    print('UIUpdatesDemo BUILD called');
    return const DemoButtons();
  }
}
