import "package:flutter/material.dart";

import "../models/meals.dart";

class MealsDetailsScreen extends StatelessWidget {
  final Meal meal;
  //final void Function(Meal meal) onToggleFavorite;

  const MealsDetailsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              //onToggleFavorite(meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              "Ingredients",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            const SizedBox(height: 24),

            Text(
              "Steps",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
