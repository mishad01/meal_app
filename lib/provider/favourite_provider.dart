import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/mealModel.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state
          .where((isFavMeal) => isFavMeal.id != meal.id)
          .toList(); //checking if the id is not present ,this is how we are removing a meal
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
  (ref) {
    return FavouriteMealNotifier();
  },
);
