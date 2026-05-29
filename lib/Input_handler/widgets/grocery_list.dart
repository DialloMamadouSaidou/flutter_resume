import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:full_cours/Input_handler/data/dummy_items.dart";
import "package:full_cours/Input_handler/widgets/new_item.dart";
import "package:google_fonts/google_fonts.dart";

import "../data/categories.dart";
import "../models/grocery_item.dart";

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  var _isLoading = true;
  String? _error;
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = loadItems();
  }

  Future<List<GroceryItem>> loadItems() async {
    final url = Uri.https(
      "flutter-prep-cdf94-default-rtdb.firebaseio.com",
      "list_shopping.json",
    );

    final reponse = await http.get(url);

    if (reponse.statusCode >= 400) {
      throw Exception("Failed to fetch grocery Items, Please try again later");
    }

    if (reponse.body == "null") {
      setState(() {
        _isLoading = false;
      });

      return [];
    }
    final Map<String, dynamic> listData = jsonDecode(reponse.body);
    final List<GroceryItem> _loadItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value["category"],
          )
          .value;
      _loadItems.add(
        GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: category,
        ),
      );
    }

    return _loadItems;
  }

  void _addItem(BuildContext context) async {
    var item = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (item == null) return;
    setState(() {
      _groceryItems.add(item);
    });
  }

  void _removeItem(GroceryItem item) async {
    setState(() {
      _groceryItems.remove(item);
    });
    final index = _groceryItems.indexOf(item);

    final url = Uri.https(
      "flutter-prep-cdf94-default-rtdb.firebaseio.com",
      "list_shopping/${item.id}.json",
    );

    final reponse = await http.delete(url);

    if (reponse.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Suppression"),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Liste Vide pour le moment",
            style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index]),

          onDismissed: (direction) {
            print("Litem concerner est: ${_groceryItems[index]}");
            _removeItem(_groceryItems[index]);
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      );
    }
    if (_error != null) {
      content = Center(child: Text(_error!));
    }
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
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    snapshot.error.toString(),
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            );
          }

          if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Liste vide",
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: _groceryItems.length,
            itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(_groceryItems[index]),

              onDismissed: (direction) {
                print("Litem concerner est: ${_groceryItems[index]}");
                _removeItem(_groceryItems[index]);
              },
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(
                  _groceryItems[index].quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
