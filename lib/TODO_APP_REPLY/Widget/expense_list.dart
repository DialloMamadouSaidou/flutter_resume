import "package:flutter/material.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/data_expense.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/expense_item.dart";

class ExpenseList extends StatelessWidget {
  final List<DataExpense> ma_liste_de_depense;
  final void Function(DataExpense data) removeExpense;
  const ExpenseList({
    super.key,
    required this.ma_liste_de_depense,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ma_liste_de_depense.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(ma_liste_de_depense[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin
        ),
        onDismissed: (direction) {
          removeExpense(ma_liste_de_depense[index]);
        },
        child: ExpenseItem(dataExpense: ma_liste_de_depense[index]),
      ),
    );
  }
}
