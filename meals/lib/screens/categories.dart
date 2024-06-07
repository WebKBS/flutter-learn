import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // late는 변수를 나중에 초기화할 때 사용한다.
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // AnimationController를 생성하고 초기화한다.
    _animationController = AnimationController(
      // vsync는 AnimationController가 화면에 표시될 때 애니메이션을 동기화하는데 사용된다.
      vsync: this,
      // 애니메이션 지속 시간을 설정한다.
      duration: const Duration(milliseconds: 300),

      lowerBound: 0, // 애니메이션의 최소값을 설정한다. 기본값은 0이다.
      upperBound: 1, // 애니메이션의 최대값을 설정한다. 기본값은 1이다.
    );

    // 애니메이션을 시작한다.
    _animationController.forward();
  }

  @override
  void dispose() {
    // 애니메이션 컨트롤러를 해제한다.
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: filteredMeals,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                }),
        ],
      ),
      // builder: (context, child) => Padding(
      //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
      //   child: child,
      // ),
      builder: (context, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut)),
          child: child, // Add this line
        );
      },
    );
  }
}
