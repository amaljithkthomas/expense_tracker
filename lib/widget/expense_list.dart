import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widget/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenseList;
  const ExpenseList({
    super.key,
    required this.expenseList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseCard(
        expenseData: expenseList[index],
      ),
      itemCount: expenseList.length,
    );
  }
}
