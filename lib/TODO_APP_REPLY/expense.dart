import "package:flutter/material.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/New_Expense.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/expense_list.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/data.dart";
import "package:full_cours/TODO_APP_REPLY/chart/chart.dart";

import "Widget/data_expense.dart";

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  void _addItemExpense(DataExpense data) {
    setState(() {
      ma_liste_de_depense.add(data);
    });
  }

  void _addExpense() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(_addItemExpense),
    );
  }

  void _removeExpens(DataExpense expense) {
    late int item;
    setState(() {
      item = ma_liste_de_depense.indexOf(expense);
      ma_liste_de_depense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(expense.title as String),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              ma_liste_de_depense.insert(item, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget Main_menu = Center(child: Text("Aucun element trouver"));

    if (ma_liste_de_depense.isNotEmpty) {
      setState(() {
        Main_menu = ExpenseList(
          ma_liste_de_depense: ma_liste_de_depense,
          removeExpense: _removeExpens,
        );
      });
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Sayeed"),
        actions: [IconButton(onPressed: _addExpense, icon: Icon(Icons.add))],
      ),

      body: width < 600
          ? Column(children: [Expanded(child: Main_menu)])
          : Row(children: [Expanded(child: Main_menu)]),
    );
  }
}
