import 'package:flutter/material.dart';
import 'package:meal_app/data/dummyData.dart';
import 'package:meal_app/data/mealModel.dart';
import 'package:meal_app/model/categoriesModel.dart';
import 'package:meal_app/screens/meals_Screen.dart';
import 'package:meal_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, Category category) {
    final CategoryFilterdMeals = widget.availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealScreen(title: category.title, meals: CategoryFilterdMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoriesGridItem(
                onSelectCategory: () {
                  selectCategory(context, category);
                },
                category: category),
        ],
      ),
    );
  }
}
