import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _SelectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();

    var activePageTitle = "카테고리";

    if (_SelectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePageTitle = "즐겨찾기";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _selectPage(index);
        },
        currentIndex: _SelectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '즐겨찾기',
          ),
        ],
      ),
    );
  }
}
