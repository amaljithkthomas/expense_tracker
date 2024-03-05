import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expenseData,
  });

  final ExpenseModel expenseData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(expenseData.title),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('\$ ${expenseData.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(expenseData.category.categoryIcon),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(expenseData.formatDate)
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
