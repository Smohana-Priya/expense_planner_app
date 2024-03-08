import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/expense_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, i) {
        return Dismissible(
            key: ValueKey(expenses[i]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[i]);
            },
            child: ExpenseItem(expenses: expenses[i]));
      },
    );
  }
}
