import 'package:expense_tracker_app/pages/expense_tracker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      home: ExpenseTrackerScreen(),
    ),
  );
}
