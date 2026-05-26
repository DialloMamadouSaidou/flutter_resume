import 'package:flutter/material.dart';
import 'package:full_cours/Meals/Screens/meals.dart';
import "package:full_cours/Meals/data/dummy_data.dart";
import 'package:full_cours/Meals/widgets/category_grid_item.dart';
import "package:full_cours/Meals/models/category.dart";

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  void _selectedCategorie(BuildContext context, Category category) {
    final filteredMeals =
        dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: "Some title",
            meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick your Category")),
      body: GridView(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectedCategorie(context, category);
              },
            ),
        ],
      ),
    );
  }
}
