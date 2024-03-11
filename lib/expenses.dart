import 'package:expense_tracker/widget/chart.dart';
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
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context1) => NewExpense(
        addData: addExpenseData,
      ),
    );
  }

  final List<ExpenseModel> expenseList = [];

  void addExpenseData({required ExpenseModel expenseModel
      // required String title,
      // required DateTime date,
      // required double amount,
      // required Category category,
      }) {
    expenseList.add(
        // ExpenseModel(
        //   title: title,
        //   date: date,
        //   amount: amount,
        //   category: category,
        // ),
        expenseModel);
    setState(() {});
  }

  void deleteItem({required ExpenseModel expenseModel}) {
    final index = expenseList.indexOf(expenseModel);

    setState(() {
      expenseList.remove(expenseModel);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                expenseList.insert(index, expenseModel);
              });
            }),
        content: const Text('Expense deleted'),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
        ),
        actions: [
          IconButton(
            onPressed: _showExpenseBottomSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: expenseList),
                Expanded(
                  child: expenseList.isEmpty
                      ? const Center(
                          child: Text('No Expense Data'),
                        )
                      : ExpenseList(
                          expenseList: expenseList,
                          deleteItem: deleteItem,
                        ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: expenseList)),
                Expanded(
                  child: expenseList.isEmpty
                      ? const Center(
                          child: Text('No Expense Data'),
                        )
                      : ExpenseList(
                          expenseList: expenseList,
                          deleteItem: deleteItem,
                        ),
                ),
              ],
            ),
    );
  }
}
