import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, required this.onRemoveExpense, super.key});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(expenses[index].id),
            child: ExpenseItem(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            background: Container(
              color: Theme.of(context).errorColor,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 15,
              ),
            ),
          );
        });
  }
}
