import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카테고리를 고르세요.'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('카테고리 1'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.red,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('카테고리 2'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.blue,
                  Colors.green,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('카테고리 3'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.purple,
                  Colors.pink,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text('카테고리 4'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.yellow,
                  Colors.amber,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}