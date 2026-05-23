import "package:flutter/material.dart";
import "package:full_cours/TODO_APP_REPLY/Widget/data_expense.dart";

class ExpenseItem extends StatefulWidget {
  final DataExpense dataExpense;
  const ExpenseItem({super.key, required this.dataExpense});

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Center(child: Text(widget.dataExpense.title)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("\$${widget.dataExpense.amount}"),
                  const Spacer(),
                  Column(
                    children: [
                      list_icon[widget.dataExpense.category],
                      const SizedBox(height: 10),
                      Text(widget.dataExpense.FormatedDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
