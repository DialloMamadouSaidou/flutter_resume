import 'package:flutter/material.dart';
import "package:full_cours/Meals/data/dummy_data.dart";
import 'package:full_cours/Meals/widgets/category_grid_item.dart';

class CategorieScreen extends StatelessWidget{

  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Pick your Category"),

      ),
      body: GridView(
          padding: const EdgeInsets.all(18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20
          ),
          children:  [
            
            for(final category in availableCategories)
               CategoryGridItem(category: category)
          ],
      )
    );
  }
}