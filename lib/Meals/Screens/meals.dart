import "package:flutter/material.dart";
import 'package:full_cours/Meals/Screens/meals_details.dart';
import 'package:full_cours/Meals/widgets/meal_item.dart';

import '../models/meals.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({super.key, required this.title, required this.meals});

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (context, meal) {
          selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh .. nothing here..",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text("Mon text")),
      body: content,
    );
  }
}
