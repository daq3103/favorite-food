import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:testtheme/model/meals.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key, required this.meal, required this.onSelectFavoriteMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectFavoriteMeal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                onSelectFavoriteMeal(meal);
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, image: meal.imageUrl),
            const SizedBox(height: 20),
            const Text('ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                textAlign: TextAlign.start,
              ),
            const SizedBox(height: 20),
            const Text('steps',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
