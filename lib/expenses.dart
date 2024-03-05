import 'package:expense_tracker/widget/expense_list.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  void _showExpenseBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context1) => const NewExpense(),
    );
  }

  final List<ExpenseModel> expenseList = [
    ExpenseModel(
      title: 'Flutter Course',
      date: DateTime.now(),
      amount: 22000,
      category: Category.work,
    ),
    ExpenseModel(
      title: 'Cinema',
      date: DateTime.now(),
      amount: 360,
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _showExpenseBottomSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpenseList(expenseList: expenseList),
          ),
        ],
      ),
    );
  }
}
