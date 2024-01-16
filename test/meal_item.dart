import 'package:flutter/material.dart';
import 'package:meal_app/data/mealModel.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          child: Stack(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl))
            ],
          ),
        ),
      ),
    );
  }
}
