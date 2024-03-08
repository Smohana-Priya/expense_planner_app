import 'package:flutter/material.dart';

import 'expenses.dart';

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(225, 5, 99, 101),
);
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkColorScheme),
    home: const ExpenseApp(),
  ));
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expenses();
  }
}
