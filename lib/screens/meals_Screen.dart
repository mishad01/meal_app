import 'package:flutter/material.dart';
import 'package:meal_app/data/mealModel.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemBuilder: (context, index) => Text(meals[index].title));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh ... nothing heree!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      body: content,
    );
  }
}
