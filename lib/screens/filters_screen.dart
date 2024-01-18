import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  FiltersScreen({
    super.key,
    required this.currentFilters,
  });
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  var __glutenFreeFilterSet = false;
  var lactosFreeFilterSet = false;
  var vegetarianFreeFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    __glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    lactosFreeFilterSet = widget.currentFilters[Filter.lactosFree]!;
    veganFilterSet = widget.currentFilters[Filter.vegan]!;
    veganFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: __glutenFreeFilterSet,
            Filter.lactosFree: lactosFreeFilterSet,
            Filter.vegetarian: vegetarianFreeFilterSet,
            Filter.vegan: veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: __glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  __glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactosFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Lactos-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactos-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Vegetarian-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegetarian-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFilterSet = isChecked;
                });
              },
              title: Text(
                "Vegan FilterSet-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include veganFilterSet-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
