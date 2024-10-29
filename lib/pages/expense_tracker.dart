import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:expense_tracker_app/widgets/add_expense.dart';
import 'package:expense_tracker_app/widgets/expense_chart.dart';
import 'package:expense_tracker_app/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerScreen extends StatefulWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  State<ExpenseTrackerScreen> createState() => _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  final List<ExpenseModel> _expenses = [
    ExpenseModel(
        title: "Flutter course",
        amount: 21.21,
        date: DateTime.now(),
        category: Category.work),
    ExpenseModel(
        title: "Avatar 2",
        amount: 14.65,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return AddExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(ExpenseModel exp) {
    setState(() {
      _expenses.add(exp);
    });
  }

  void _removeExpense(ExpenseModel exp) {
    setState(() {
      _expenses.remove(exp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 52, 0, 97),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const ExpenseChart(),
          Expanded(
            child: ExpenseList(
              expenses: _expenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
