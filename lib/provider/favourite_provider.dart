import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/mealModel.dart';

// class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
//   FavouriteMealNotifier() : super([]);

//   void toggleMealFavouriteStatus(Meal meal) {
//     final isFavourite = state.contains(meal);
//     if (isFavourite) {
//       state = state
//           .where((isFavMeal) => isFavMeal.id != meal.id)
//           .toList(); //checking if the id is not present ,this is how we are removing a meal
//     } else {
//       state = [...state, meal];
//     }
//   }
// }

// final favouriteMealProvider =
//     StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
//   (ref) {
//     return FavouriteMealNotifier();
//   },
// );
class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      //"favMeal.id != meal.id" with this condition we are keeping an item to the list if the item is not already present in the list
      state = state.where((favMeal) => favMeal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final FavouriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealNotifier();
  },
);
