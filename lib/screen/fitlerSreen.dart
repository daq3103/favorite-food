import 'package:flutter/material.dart';
import 'package:testtheme/widget/drawerSreen.dart';
import 'package:testtheme/screen/ChangeScreen.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FitlerDrawerScreen extends StatefulWidget {
  const FitlerDrawerScreen({super.key});

  @override
  State<FitlerDrawerScreen> createState() => _FitlerDrawerScreenState();
}

class _FitlerDrawerScreenState extends State<FitlerDrawerScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      drawer: DrawerScreens(pickDrawer: (valueDrawer) {
        if (valueDrawer == 'Meal') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChangeScreen()));
        }
      }),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet,
            });
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten- free meals'),
              secondary: const Icon(Icons.filter_alt_sharp),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include gluten- free meals'),
              secondary: const Icon(Icons.filter_alt_sharp),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
              title: const Text('Vegetarian'),
              subtitle: const Text('Only include gluten- free meals'),
              secondary: const Icon(Icons.filter_alt_sharp),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: const Text('Vegan'),
              subtitle: const Text('Only include gluten- free meals'),
              secondary: const Icon(Icons.filter_alt_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
