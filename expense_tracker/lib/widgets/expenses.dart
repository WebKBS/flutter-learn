import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Train ticket',
      amount: 30.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Dinner',
      amount: 20.0,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Laptop',
      amount: 1000.0,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true, // 화면 전체를 사용하도록 설정
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex =
        _registeredExpenses.indexOf(expense); // 해당 expense의 index를 찾음

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 이전 SnackBar를 숨김

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('삭제되었습니다.'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: '되돌리기',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                  expenseIndex, expense); // 삭제된 expense를 index에 추가
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet!', style: TextStyle(fontSize: 20)),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          )
        ],
      ),
      body: Column(children: [
        Chart(expenses: _registeredExpenses),
        Expanded(child: mainContent),
      ]),
    );
  }
}
