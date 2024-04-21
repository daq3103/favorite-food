import 'package:flutter/material.dart';
import 'package:testtheme/screen/categories.dart';
import 'package:testtheme/screen/fitlerSreen.dart';
import 'package:testtheme/widget/drawerSreen.dart';
import 'package:testtheme/screen/meal.dart';
import 'package:testtheme/model/meals.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({super.key});

  @override
  State<ChangeScreen> createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  int _selectedIndex = 0;
  String titleSreen = 'Pick your Category!!!';
  // ham thong bao

  List<Meal> favoriteMeals = [];
  void noticeAddMeal(String mess) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mess)));
  }

  void _selectMeal(Meal meal) {
    final isMeal = favoriteMeals.contains(meal);
    if (isMeal) {
      setState(() {
        favoriteMeals.remove(meal);
        noticeAddMeal('Meal removed of MealList');
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        noticeAddMeal('Meal added of MealList');
      });
    }
  }

  // hàm chuyển đổi màn hình
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// hàm chuyển đổi màn Drawer
  void _pickDrawer(String selectDrawer)  {
    Navigator.pop(context);
    if (selectDrawer == 'Fitlers') {
       Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => const FitlerDrawerScreen()),
      );
    }
  }

  /* Navigator. push(context,
          MaterialPageRoute(builder: (context) => const FitlerDrawerScreen()));
    }
*/
  @override
  Widget build(BuildContext context) {
    Widget myScreen = CategoryScreen(onSelectFavoriteMeal: _selectMeal);
    // logic chuyển đổi 2 màn
    if (_selectedIndex == 1) {
      myScreen = MealSreen(
        meal: favoriteMeals,
        onSelectFavoriteMeal: _selectMeal,
      );
      titleSreen = 'My Favorite!!!';
    } else {
      myScreen = CategoryScreen(
        onSelectFavoriteMeal: _selectMeal,
      );
      titleSreen = 'Pick your Category!!!';
    }

    return Scaffold(
        drawer: DrawerScreens(pickDrawer: _pickDrawer),
        appBar: AppBar(
          title: Text(titleSreen),
        ),
        body: myScreen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            // index = 0
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            // index = 1
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ));
  }
}
