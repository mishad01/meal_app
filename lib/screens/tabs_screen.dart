import 'package:flutter/material.dart';
import 'package:meal_app/screens/catagories_screen.dart';
import 'package:meal_app/screens/meals_Screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  int selectedpageIndex = 0;

  void selectPage(int ind) {
    setState(() {
      selectedpageIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    String activePageTitle = "Categories";
    if (selectedpageIndex == 1) {
      activePage = MealScreen(title: "Favourite", meals: []);
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedpageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
      ),
    );
  }
}
