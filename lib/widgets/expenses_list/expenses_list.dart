import 'package:flutter/material.dart';
import '../../models/expense_data.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.onRemoveExpense, {super.key, required this.expenses});

  final List<ExpenseData> expenses;
  final void Function(ExpenseData expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
