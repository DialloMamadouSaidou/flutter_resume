import "package:flutter/material.dart";
import "package:full_cours/Input_handler/data/dummy_items.dart";
import "package:full_cours/Input_handler/widgets/new_item.dart";

import "../data/categories.dart";

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  void _addItem(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),

        actions: [
          IconButton(
            onPressed: () {
              _addItem(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: groceryItems[index].category.color,
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
