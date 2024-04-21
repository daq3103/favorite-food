import 'package:flutter/material.dart';
import 'package:testtheme/model/meals.dart';
import 'package:testtheme/widget/meal_item.dart';
import 'package:testtheme/screen/detail_screen.dart';

class MealSreen extends StatelessWidget {
  const MealSreen({super.key, required this.meal, required this.onSelectFavoriteMeal});
  final List<Meal> meal;
    final void Function(Meal meal) onSelectFavoriteMeal;
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('test'),
    );
    if (meal.isEmpty) {
      content = const Center(
        child: Text('Không có dữ liệu!'),
      );
    }
    // hàm hiển thị chi tiết món ăn
    void onSelectDetailMeal(BuildContext context, Meal meal) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => DetailScreen(meal: meal , onSelectFavoriteMeal: onSelectFavoriteMeal, ))));
    }

    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) => MealItem(
          meal: meal[index],
          onSelectDetail: () {
            onSelectDetailMeal(context, meal[index]);
          },
        ),
      );
    }
    return content;
  }
}
