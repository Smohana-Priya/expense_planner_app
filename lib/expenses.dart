import 'package:flutter/material.dart';
import 'package:quiz_app/new_expense.dart';
import 'package:quiz_app/widgets/epenses_list.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: "550",
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: "150",
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _openModalSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addNewExpense,
          );
        });
  }

  void _addNewExpense(Expense expense) {
    // print("Inside the _addNewExpense");
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(onPressed: _openModalSheet, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            const Text("Charts"),
            Expanded(
                child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ))
          ],
        ),
      ),
    );
  }
}
