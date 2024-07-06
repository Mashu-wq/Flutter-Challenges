import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expenses});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenses.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\$${expenses.amount}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
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
