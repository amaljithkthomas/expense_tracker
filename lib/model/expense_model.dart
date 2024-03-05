import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  food,
  work,
  leisure,
  travel;

  IconData get categoryIcon {
    switch (this) {
      case Category.food:
        return Icons.lunch_dining;
      case Category.leisure:
        return Icons.movie;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.work:
        return Icons.work;
    }
  }
}

// const Map<Category, IconData> categoryIcon = {
//   Category.food: Icons.lunch_dining,
//   Category.work: Icons.work,
//   Category.travel: Icons.flight_takeoff,
//   Category.leisure: Icons.movie,
// };

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();
  String get formatDate {
    return formatter.format(date);
  }
}
