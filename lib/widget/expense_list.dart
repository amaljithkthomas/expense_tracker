import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widget/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenseList;
  final void Function({required ExpenseModel expenseModel}) deleteItem;

  const ExpenseList({
    super.key,
    required this.expenseList,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          deleteItem(expenseModel: expenseList[index]);
        },
        key: ValueKey(expenseList[index]),
        child: ExpenseCard(
          expenseData: expenseList[index],
        ),
      ),
      itemCount: expenseList.length,
    );
  }
}
