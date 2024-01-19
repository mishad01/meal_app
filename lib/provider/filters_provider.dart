import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Filter filter, bool isActive) {
    //State[Filter] = isActive //It is not allowed because we are mutating state(MUtating ==changing)
    state = {
      ...state,
      filter:
          isActive, //now this will then over ride the previous fliter value to new value as an example false to true
    };
  }

  void setFilterss(Map<Filter, bool> chosenFilters) {
    state =
        chosenFilters; //state is a variable or field that holds the current state of something in the program.
  }
}

final FiltersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
