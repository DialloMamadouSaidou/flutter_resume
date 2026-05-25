import "package:flutter/material.dart";

import '../models/meals.dart';

class MealsScreen extends StatelessWidget{
  final String title;
  final List<Meal> meals;

  const MealsScreen({super.key,
    required this.title,
    required this.meals
  });

  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Text(
          meals[index].title
      ),
    );

    if(meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh .. nothing here..",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary
              )
            ),
            const SizedBox(height: 16),
            Text('Try selecting a different category!',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                )
            )
          ],
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon text")
      ),
      body: content
    );
  }
}