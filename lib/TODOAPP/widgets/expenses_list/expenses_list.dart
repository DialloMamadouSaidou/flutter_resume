import "package:flutter/material.dart";
import "package:full_cours/TODOAPP/widgets/expenses_list/expense_item.dart";
import "package:full_cours/TODOAPP/models/expense.dart";

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin,
        ),

        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            removeExpense(expenses[index]);
          }
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
