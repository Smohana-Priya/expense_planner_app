import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expenses;

  const ExpenseItem({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(expenses.title),
            Row(
              children: [
                Text(
                  expenses.amount.toString(),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categortIcon[expenses.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenses.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
