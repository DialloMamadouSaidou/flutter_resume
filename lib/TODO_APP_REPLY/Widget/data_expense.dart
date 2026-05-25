import "dart:math";

import "package:flutter/material.dart";
import "package:intl/intl.dart";
import 'package:uuid/uuid.dart';

const uuidGenerator = Uuid();
var format = DateFormat.yMd();

enum Category { travel, food, leisure, work }

Map<Category, dynamic> list_icon = {
  Category.travel: Icon(Icons.wallet_travel),
  Category.food: Icon(Icons.fastfood),
  Category.leisure: Icon(Icons.beach_access),
  Category.work: Icon(Icons.book),
};

class DataExpense {
  final String title;
  final double amount;
  final DateTime datetime;
  final String uuid;
  final Category category;

  DataExpense({
    required this.title,
    required this.amount,
    required this.datetime,
    required this.category,
  }) : uuid = uuidGenerator.v4();

  String get FormatedDate {
    return format.format(datetime);
  }
}

class ExpenseBucket {
  final Category category;
  final List<DataExpense> expenses;

  ExpenseBucket.forCategory(List<DataExpense> all_expense, this.category)
    : expenses = all_expense
          .where((element) => element.category == category)
          .toList();
  const ExpenseBucket({required this.category, required this.expenses});

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}

//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
