import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [Text('Hello')],
      ),
    );
  }
}
