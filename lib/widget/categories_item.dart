import 'package:flutter/material.dart';
import 'package:testtheme/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.onSelectedCategory});
  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectedCategory();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9)
            ])),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
