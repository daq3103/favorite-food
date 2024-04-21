import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:testtheme/model/meals.dart';
import 'package:testtheme/widget/meal_detail.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.onSelectDetail})
      : super(key: key);
  final Meal meal;
  final void Function() onSelectDetail;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onSelectDetail();
        },
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: meal.imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 8, horizontal: 16),
                    child: Center(
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 20,
              child: Row(
                children: [
                  MealDetail(
                      textIcon: '${meal.duration.toString()} min',
                      icon: Icons.av_timer_outlined),
                  const SizedBox(width: 20),
                  MealDetail(
                      textIcon: '${meal.affordability.name} ',
                      icon: Icons.attach_money),
                  const SizedBox(width: 20),
                  MealDetail(
                      textIcon: '${meal.complexity.name} ',
                      icon: Icons.view_comfy_sharp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
