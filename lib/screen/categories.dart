import 'package:flutter/material.dart';
import 'package:testtheme/model/category.dart';
import 'package:testtheme/model/meals.dart';
import 'package:testtheme/widget/categories_item.dart';
import 'package:testtheme/data/data.dart';
import 'package:testtheme/screen/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onSelectFavoriteMeal});
  final void Function(Meal meal) onSelectFavoriteMeal;
  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> content = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MealSreen(meal: content,
        onSelectFavoriteMeal:  onSelectFavoriteMeal
          
        )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectedCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
