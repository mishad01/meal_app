import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummyData.dart';
import 'package:meal_app/provider/favourite_provider.dart';
import 'package:meal_app/provider/meals_provider.dart';
import 'package:meal_app/screens/catagories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_Screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

const KintialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabScreen> {
  int selectedpageIndex = 0;
  Map<Filter, bool> selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactosFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  void selectPage(int ind) {
    setState(() {
      selectedpageIndex = ind;
    });
  }

  void setDrawerScreen(String indentifier) async {
    if (indentifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? KintialFilters;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availablePage = meals.where(
      // Here the meal will be kept if its true, otherwise it will be removed
      (meal) {
        if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (selectedFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget activePage = CategoriesScreen(
      availableMeal: availablePage,
    );
    String activePageTitle = "Categories";

    if (selectedpageIndex == 1) {
      final FavouriteMeals = ref.watch(FavouriteMealProvider);
      activePage = MealScreen(
        meals: FavouriteMeals,
      );
      activePageTitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectFilterScreen: setDrawerScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
