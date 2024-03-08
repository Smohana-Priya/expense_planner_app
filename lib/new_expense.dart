// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleCntrl = TextEditingController();
  final _amountCntrl = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickeDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _selectedDate = pickeDate;
    });
  }

  void _submitExpenseDate() {
    // final enteredAmount = double.tryParse(_amountCntrl.text);
    if (_titleCntrl.text.trim().isEmpty ||
        _amountCntrl.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text(
                "Invalid Input",
              ),
              content: const Text("Please Enter Valid Input"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"))
              ],
            );
          });
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleCntrl.text.trim(),
        amount: _amountCntrl.text,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleCntrl.dispose();
    _amountCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 50, 15, 25),
      child: Column(
        children: [
          TextField(
            controller: _titleCntrl,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountCntrl,
                  decoration: const InputDecoration(
                      prefixText: '\$', label: Text("Amount")),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "No date selected"
                        : DateFormat.yMd().format(_selectedDate!)),
                    IconButton(
                        onPressed: _openDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: _submitExpenseDate,
                  child: const Text("Save Expenses"))
            ],
          )
        ],
      ),
    );
  }
}
