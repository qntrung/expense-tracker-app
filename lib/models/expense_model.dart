// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, leisure, flight, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.flight: Icons.flight_takeoff,
  Category.work: Icons.work,
};

final formatter = DateFormat.yMMMMd();

class ExpenseModel {
  String id;
  String title;
  double amount;
  DateTime date;
  Category category;
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  get formattedDate {
    return formatter.format(date);
  }
}
