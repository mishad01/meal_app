import 'package:flutter/material.dart';
import 'package:meal_app/data/dummyData.dart';
import 'package:meal_app/screens/catagories_screen.dart';
import 'package:meal_app/screens/meals_Screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: CategoriesScreen(),
    );
  }
}
